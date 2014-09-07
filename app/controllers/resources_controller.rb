class ResourcesController < ApplicationController
  respond_to :html

  before_action :authenticate_user!, :except => [:index, :show]

  expose(:resources) { Resource.all.page(params[:id]).page(params[:resources]).per(10) }
  expose(:resource, attributes: :empty_params)
  expose(:pages) {|default| default.ordered_by_title}

  autocomplete :page, :title

  #authorize_actions_for Resource

  def new
    respond_with(resource)
  end

  def create
    resource.attributes = resource_params
    resource.user = current_user
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

  private

  def empty_params
    params.require(:resource).permit()
  end

  def resource_params
    if current_user.can_change_link?(resource)
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