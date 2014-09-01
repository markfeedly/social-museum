module SecVersioning
  def self.included(base)
    base.send(:has_secretary)
  end

  def version(version_number)
    reversion = self.class.new
    reversion.id = id
    attrs = reversion.attributes.keys
    versions.where("version_number <= ?", version_number).order("version_number DESC").each do |v|
      reversion.created_at ||= v.created_at
      reversion.updated_at ||= v.created_at
      v.object_changes.each do |key, (_, change)|
        if attrs.include?(key)
          reversion[key] = change
          attrs.delete(key)
        end
        break if attrs.empty?
      end
    end
    reversion
  end

  def load_versions
    versions.pluck(:version_number).map do |v|
      version(v)
    end
  end
end