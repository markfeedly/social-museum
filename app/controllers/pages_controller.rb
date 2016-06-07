class PagesController < ApplicationController
  respond_to :html

  expose_wants_key = :page
  expose(:want_title) { params[expose_wants_key][:title_attributes][:title] || '' }
  expose(:want_str_categories) { params[expose_wants_key][:categories_as_str] || '' }
  expose(:want_str_tags) { params[expose_wants_key][:tags_as_str] || '' }
  expose(:want_description) { params[expose_wants_key][:description] || '' }
  expose(:want_url) { params[expose_wants_key][:url] || '' }

  expose(:page, attributes: :page_params, finder: :find_by_slug)
  expose(:pages)
  expose(:paginated_pages) { pages.page(params[:page]).per(10)}
  expose(:page_history) do
    Kaminari.paginate_array(page.load_versions).page(params[:history]).per(10)
  end

  authorize_actions_for Page
  before_filter :authenticate_user!, except: [:index]


  def show
    respond_with(page)
  end

  def new
    page.build_title
    respond_with(page)
  end

  def create
    page.set_tags_from_string( params[:page][:tags_as_str] )
    page.set_categories_from_string( params[:page][:categories_as_str] )
    page.logged_user_id = current_user.id
    page.user_id = current_user.id
    page.save
    respond_with(page)
  end

  def edit
    respond_with(page)
  end

  def update
    page.set_tags_from_string(       params[:page][:tags_as_str] )
    page.set_categories_from_string( params[:page][:categories_as_str] )
    page.logged_user_id = current_user.id
    begin
      page.update_attributes(page_params)
      render 'page/show'
    rescue => error
      if error.instance_of?(ActiveRecord::StaleObjectError)
        flash[:warning] = 'Another user has made a conflicting edit, you can use this form to resolve the differences and save the resource'
        resource.reload
        render 'page/edit_with_conflicts'
      else
        raise "unknown error during resource#update: #{error.inspect}"
      end
    end
  end

  def index
    respond_with(pages)
  end

  def destroy
    page.destroy
    respond_with(page)
  end

  def subscribe
    page.subscribe(current_user)
    redirect_to page_path(page)
  end

  def unsubscribe
    page.unsubscribe(current_user)
    redirect_to page_path(page)
  end

  private

  def page_params
    params.require(:page).permit( :categories,
                                  :description,
                                  :lock_version,
                                  :tags,
                                  :categories,
                                  title_attributes: [:title, :id])
  end
end
