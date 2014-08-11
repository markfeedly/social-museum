ActiveSupport.on_load(:active_record) do
  Dir[Rails.root + 'config/upload_types/*.csv'].each do |upload_type|
    UploadTypes.add_file(upload_type)
  end
end