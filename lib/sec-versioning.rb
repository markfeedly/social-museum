module SecVersioning
  def self.included(base)
    base.send(:has_secretary)
  end

  def load_versions
    versions.map do |v|
      version(v.version_number, versions: versions)
    end
  end

  def version(version_number, versions: nil)
    reversion = self.class.new
    reversion.id = id
    self.class.versioned_attributes.each do |v|
      reversion.send("#{v}=", nil)
    end

    versions ||= self.versions.where("version_number <= ?", version_number).order("version_number DESC")

    versions.each do |v|
      next if v.version_number > version_number
      merge_version(v, reversion)
      break if reversion_complete?(reversion)
    end
    reversion
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

  def merge_version(v, reversion)
    reversion.created_at ||= v.created_at
    reversion.updated_at ||= v.created_at
    v.object_changes.each do |key, (_, change)|
      if change.is_a? Hash
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

end