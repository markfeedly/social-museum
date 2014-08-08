class ResourcesController < ApplicationController
  respond_to :html

  before_action :authenticate_user!, :except => [:index, :show]

  expose(:resources) { Resource.all.page(params[:id]).page(params[:resources]).per(10) }
  expose(:resource)  { Resource.where(id: params[:id]).first }

  def new
    self.resource = Resource.new
  end

  def create
    self.resource = current_user.resources.new(resource_params)
    resource.save
    respond_with(resource)
  end

  def index
    respond_with(resources)
  end

  def show
    unless resource
      flash[:warning] = ["Resource #{params[:id]} does not exist"]
      redirect_to resources_path
    end
  end

  def edit
    unless resource
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
    authorize_action_for resource # user must be an admin
    resource.destroy
    respond_with(resource)
  end

  private

  def resource_params
    if resource.nil? || current_user.can_change_link?(resource)
      params.require(:resource).permit( :lock_version,
                                        :url,
                                        :file,
                                        :description,
                                        :title,
                                        :resource_usages)
                               .merge(pages: get_selected_pages)
    else
      params.require(:resource).permit( :lock_version,
                                        :description,
                                        :title,
                                        :resource_usages)
                               .merge(pages: get_selected_pages)
    end
  end

  def get_selected_pages
    resource_pages_params.reject{ |_, checked| checked == '0' }
                         .map   { |title| Page.find_by_title(title.first) }
  end

  def resource_pages_params
    params['resource_pages'] || []
  end
end