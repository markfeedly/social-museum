module SecVersioning
  def self.included(base)
    base.send(:has_secretary)
    base.send(:attr_accessor, :version_object_changes)
    base.send(:attr_reader, :user)
    base.send(:prepend, PrependMethods)
  end

  def load_versions
    versions.order(version_number: :desc).map do |v|
      version(v.version_number, versions: versions)
    end
  end

  def version(version_number, versions: nil)
    reversion = self.class.new
    self.class.versioned_attributes.each do |v|
      if v == 'tag_items' || v == 'category_items'
        reversion.send("#{v}=", [])
      else
        reversion.send("#{v}=", nil)
      end
    end

    reversion.id = id
    reversion.created_at = created_at
    reversion.version_object_changes = {}

    versions ||= self.versions.where("version_number <= ?", version_number).order("version_number DESC")
    versions.each do |v|
      next if v.version_number > version_number
      merge_version(v, reversion)
      break if reversion_complete?(reversion)
    end
    reversion
  end

  def merge_version(v, reversion)
    reversion.updated_at ||= v.created_at
    reversion.user ||= v.user_id
    v.object_changes.each do |key, (from, change)|
      unless reversion.version_object_changes.has_key?(key)
        reversion.version_object_changes[key] = {}
        reversion.version_object_changes[key][:from] = from
        reversion.version_object_changes[key][:to] = change
      end

      if change.is_a?(Hash) || change.is_a?(Array)  # mvh added or Array
        merge_association(key, reversion, change)
      else
        merge_attribute(key, reversion, change)
      end
    end
  end

  def reversion_complete?(reversion)
    reversion.class.versioned_attributes.all? do |a|
      reversion.send(a).present?
    end
  end

  def merge_association(name, reversion, change)
    if reversion.send(name).blank?
      if respond_to?("build_#{name}")
        reversion.send("build_#{name}", change)
      else
        reversion.send(name).new(change)
      end
    end
  end

  def merge_attribute(name, reversion, change)
    reversion[name] ||= change
  end

  # This fixes the vanishing act of tags in history
  module PrependMethods
    def user=(user_id)
      @user = User.find(user_id)
    end

    def tags
      if version_object_changes.present?
        Tag.where(id: tag_items.map(&:tag_id))
      else
        super
      end
    end

    def categories
      if version_object_changes.present?
        Category.where(id: category_items.map(&:category_id))
      else
        super
      end
    end
  end
end