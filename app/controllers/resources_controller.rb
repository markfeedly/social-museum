class ResourcesController < ApplicationController
  include ResourceHelper
  respond_to :html

  expose(:resource, attributes: :resource_params, finder: :find_by_slug)
  expose(:resources)
  expose(:paginated_resources) { resources.page(params[:resource]).per(10)}
  expose(:resource_history) do
    Kaminari.paginate_array(resource.load_versions).page(params[:resource_ci]).per(10)
  end

  expose(:want_title) { params[:resource][:title_attributes][:title] || '' }
  expose(:want_str_categories) { params[:resource][:categories_as_str] || '' }
  expose(:want_str_tags) { params[:resource][:tags_as_str] || '' }
  expose(:want_description) { params[:resource][:description] || '' }
  expose(:want_url) { params[:resource][:url] || '' }

  autocomplete :resource, :title

  #todo use: authorize_actions_for Resource
  before_action :authenticate_user!, :except => [:index, :show]


  def get_uploaded_file
    upload_dir = ENV['PUBLIC_UPLOAD_DIR']+'/'
    file_name = upload_dir + "#{params[:type]}/#{params[:id]}/#{params[:name]}.#{params[:format]}"
    send_file file_name, type: get_mime(params[:format].downcase), disposition: 'inline'
  end

  def new
    resource.build_title
    respond_with(resource)
  end

  def create
    resource.creator = current_user
    resource.name = params[:resource][:title_attributes][:title]
    resource.logged_user_id = current_user.id
    resource.user_id = current_user.id
    if resource.save
      resource.set_tags_from_string( params[:resource][:tags_as_str] )
      resource.set_categories_from_string( params[:resource][:categories_as_str] )
    end
    respond_with(resource)
  end

  def index
    respond_with(resources)
  end

  def show
    if resource
      respond_with(resource)
    else
      flash[:warning] = ["Resource #{params[:id]} does not exist"]
      redirect_to resources_path
    end
  end

  def edit
    if resource
      respond_with(resource)
    else
      flash[:warning] = ["Resource #{params[:id]} does not exist"]
      redirect_to resources_path
    end
  end

  def update
    resource.last_editor = current_user
    resource.name = params[:resource][:title_attributes][:title]
    resource.logged_user_id = current_user.id
    resource.user_id = current_user.id
    begin
      resource.update_attributes(resource_params)
      resource.set_tags_from_string( params[:resource][:tags_as_str] )
      resource.set_categories_from_string( params[:resource][:categories_as_str] )
      respond_with(resource)
    rescue => error
      if error.instance_of?(ActiveRecord::StaleObjectError)
        #flash[:warning] = 'Another user has made a conflicting edit, you can use this form to resolve the differences and save the resource'
        resource.reload
        render 'resources/edit_with_conflicts'
      else
        raise "Error during resource#update: #{error.inspect}"
      end
    end
  end


  def destroy
    resource.destroy
    respond_with(resource)
  end

  def subscribe
    resource.subscribe(current_user)
    redirect_to resource_path(resource)
  end

  def unsubscribe
    resource.unsubscribe(current_user)
    redirect_to resource_path(resource)
  end

  def autocomplete_resource_title
    render json: Title.where(Title.arel_table[:title].matches("%#{params[:term]}%")).pluck(:title)
  end

  private

  def empty_params
    params.require(:resource).permit()
  end

  def resource_params
    params.require(:resource).permit(:categories,
                                     :description,
                                     :lock_version,
                                     :url,
                                     :file,
                                     :tags,
                                     title_attributes: [:title, :id],
                                     resource_usages_attributes: [:id, :resource_title, :_destroy])
  end

  def resource_resources_params
    params['resource_resources'] || []
  end
end