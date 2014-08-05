class ResourcesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  expose(:resources) { Resource.all.page(params[:id]).page(params[:resources]).per(10) }
  expose(:resource)  { Resource.where(id: params[:id]).first }

  def new
    self.resource = Resource.new
  end

  def create
    self.resource = Resource.new( image:       params['resource']['image'],
                                  url:         params['resource']['url'],
                                  description: params['resource']['description'],
                                  title:       params['resource']['title'],
                                  pages:       get_selected_pages,
                                  user:        current_user )
    if resource.save
      redirect_to resource_url(resource)
    else
      render :new
    end
  end

  def index
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
    update_params  = { description: params['resource']['description'],
                       title:       params['resource']['title'],
                       url:         params['resource']['url'],
                       image:       params['resource']['image'],
                       pages:       get_selected_pages }

    if resource.update_attributes(update_params)
      redirect_to resource_url(resource)
    else
      render :edit
    end

  rescue ActiveRecord::StaleObjectError
    flash.now[:warning] = 'Another user has made a conflicting change, you can resolve the differences and save the resource again'
    resource.reload
    @conflict = 'set me appropriately'
    render :edit_with_conflicts
  end

  def destroy
    authorize_action_for resource # user must be an admin
    resource.destroy
    redirect_to :back
  end

  def page_params
    params.require(:resource).permit( :image,
                                      :description,
                                      :title,
                                      :resource_usages,
                                      :pages )
  end

  private

  def get_selected_pages
    params['resource_pages'].reject{ |_, checked| checked == '0' }
                            .map   { |title| Page.find_by_title(title.first) }
  end

  def need_to_update_resource?(update_params)
       resource.title       != update_params[:title]       ||
       resource.description != update_params[:description] ||
       resource.pages       != update_params[:pages]
  end
end