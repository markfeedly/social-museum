module ResourceHelper
  def make_url(resource)
    res_url = String.new(resource.url)
    res_url.gsub( /^\/.*uploads/, "/get_uploaded_file" )
  end

  def get_mime(key)
    mime_hash = {}
    add_directory(Rails.root + 'config/upload_types/*.csv', mime_hash)
    mime_hash[key]
  end

  def add_file(filename, mime_hash)
    CSV.foreach(filename, headers: true) do |row|
      mime_hash[row['extension']] = row['mime_type']
    end
  end

  def add_directory(dir, mime_hash)
    Dir[dir].each do |upload_type|
      add_file(upload_type, mime_hash)
    end
  end

end
