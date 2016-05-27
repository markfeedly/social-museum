module ResourceHelper
  def make_url(resource)
    res_url = String.new(resource.url)
    res_url.gsub( /^\/.*uploads/, "/get_uploaded_file" )
  end
end