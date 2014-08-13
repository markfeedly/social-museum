ActiveSupport.on_load(:active_record) do
  UploadTypes.add_directory(Rails.root + 'config/upload_types/*.csv')
end