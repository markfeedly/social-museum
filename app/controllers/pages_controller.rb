class PagesController < ApplicationController
  respond_to :html

  expose(:want_title) { params[:page][:title_attributes][:title] || '' }
  expose(:want_str_categories) { params[:page][:categories_as_str] || '' }
  expose(:want_str_tags) { params[:page][:tags_as_str] || '' }
  expose(:want_description) { params[:page][:description] || '' }
  expose(:want_url) { params[:page][:url] || '' }

  expose(:page, attributes: :page_params, finder: :find_by_slug)
  expose(:pages)
  expose(:paginated_pages) { pages.page(params[:page]).per(10)}
  expose(:page_history) do
    Kaminari.paginate_array(page.load_versions).page(params[:history]).per(10)
  end

  authorize_actions_for Page

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
    page.logged_user_id = current_user.id
    begin
      page.update_attributes(page_params)
      page.set_tags_from_string( params[:page][:tags_as_str] )
      page.set_categories_from_string( params[:page][:categories_as_str] )
      respond_with(page)
    rescue => error
      if error.instance_of?(ActiveRecord::StaleObjectError)
        #flash[:warning] = 'Another user has made a conflicting edit, you can use this form to resolve the differences and save the page'
        page.reload
        render 'pages/edit_with_conflicts'
      else
        raise "Error during page#update: #{error.inspect}"
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
