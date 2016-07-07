module SecVersioning
  def self.included(base)
    base.send(:has_secretary)
    base.send(:attr_accessor, :version_object_changes)
    base.send(:attr_reader, :user)
    # base.send(:prepend, PrependMethods)
  end

  def load_versions
    puts "load_versions"
    versions.order(version_number: :desc).map do |v|
      version(v.version_number, versions: versions)
    end
  end

  def version(version_number, versions: nil)
    puts "version: version_number #{version_number}, versions #{versions}"
    reversion = self.class.new
    @tags_changed = false
    @categories_changed = false
    self.class.versioned_attributes.each do |v|
      if v == 'tags' || v == 'categories'
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
    puts "merge_version: v #{v}, reversion #{reversion}"
    reversion.updated_at ||= v.created_at
    reversion.user ||= User.find_by_id(v.user_id)
    v.object_changes.each do |key, (from, change)|
      unless reversion.version_object_changes.has_key?(key)
        reversion.version_object_changes[key] = {}
        reversion.version_object_changes[key][:from] = from
        reversion.version_object_changes[key][:to] = change
      end

      if change.is_a?(Hash) || change.is_a?(Array) # mvh added or Array
        puts "====================== potentially change #{key}"
        if key == 'title'
          puts "====================== call merg_association for #{key}"
          merge_association(reversion, key, change)
        end

        if key == 'tags'&& ! @tags_changed
          puts "====================== call merg_association for #{key}"
          merge_association(reversion, key, change)
          @tags_changed = true
        end
        if key == 'categories' && ! @categories_changed
          puts "====================== call merg_association for #{key}"
          merge_association(reversion, key, change)
          @categories_changed = true
        end
      else
        merge_attribute(reversion, key, change)
      end
    end
  end

  def reversion_complete?(reversion)
    reversion.class.versioned_attributes.all? do |a|
      reversion.send(a).present?
    end
  end

  def merge_association(reversion, name, change)
    puts "merge_association: reversion #{reversion}, name #{name}, change #{change}"
    if reversion.send(name).blank?
      puts "**** making change"
      if respond_to?("build_#{name}")
        puts "**** build_#{name} change"
        ret = reversion.send("build_#{name}", change)
        puts "**** returns #{ret}"

      else
        puts "**** name change"
        ret = reversion.send(name).new(change)
        puts "**** returns #{ret}"

      end
    end
  end

  def merge_attribute(reversion, name, change)
    puts "merge_attribute: reversion #{reversion}, name #{name}, change #{change}"
    reversion[name] ||= change
  end
end


=begin
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
=end
