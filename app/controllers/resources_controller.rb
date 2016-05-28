class ResourcesController < ApplicationController
  respond_to :html

  include ResourceHelper

  before_action :authenticate_user!, :except => [:index, :show]

=begin
  expose(:resources) { Resource.page(params[:id]).per(10) }
  # expose(:resource, attributes: :empty_params)
  expose(:resource) { r = Resource.where(id: params[:id]).first ; r == nil ? Resource.new : r }
  expose(:pages) {|default| default.ordered_by_title}
=end

  expose(:resource, attributes: :resource_params, finder: :find_by_slug)
  expose(:resources)
  expose(:paginated_resources) { resources.resource(params[:resource]).per(10)}
  expose(:resource_history) do
    Kaminari.paginate_array(resource.load_versions).page(params[:resource_ci]).per(10)
  end

  autocomplete :page, :title

  #authorize_actions_for Resource

  def get_uploaded_file
    upload_dir = "/Users/mark/RubymineProjects/social-museum/uploads/"
    file_name = upload_dir + "#{params[:type]}/#{params[:id]}/#{params[:name]}.#{params[:format]}"
    send_file file_name, type: get_mime(params[:format]), disposition: 'inline'
  end

  def new
    resource.build_title
    respond_with(resource)
  end

  def create
    resource.set_tags_from_string(       params[:resource][:tags_as_str] )
    resource.set_categories_from_string( params[:resource][:categories_as_str] )
    resource.logged_user_id = current_user.id

    #resource.attributes = resource_params
    #resource.user = current_user
    resource.save
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
    resource.update_attributes(resource_params)
    respond_with(resource)
  rescue ActiveRecord::StaleObjectError
    flash.now[:warning] = 'Another user has made a conflicting change, you can resolve the differences and save the resource again'
    resource.reload
    @conflict = 'set me appropriately'
    render :edit_with_conflicts
  end

  def destroy
    resource.destroy
    respond_with(resource)
  end

  def autocomplete_page_title
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
                                 resource_usages_attributes: [:id, :page_title, :_destroy])

=begin
    if current_user.can_change_link?(resource)
      params.require(:resource).permit( :lock_version,
                                        :url,
                                        :file,
                                        :description,
                                        :title,
                                        resource_usages_attributes: [:id, :page_title, :_destroy])
    else
      params.require(:resource).permit( :lock_version,
                                        :description,
                                        :title,
                                        resource_usages_attributes: [:id, :page_title, :_destroy])
    end
=end

  end

  def resource_pages_params
    params['resource_pages'] || []
  end
end