class PagesController < ApplicationController
  expose(:page) { Page.find_by_slug(params[:id]).decorate  }
  expose(:page_states) { Kaminari.paginate_array(page.history.reverse).page(params[:page_states]).per(5) }
  expose(:page_summaries) { Page.order('title ASC').page(params[:page_summaries]).per(10) }

  before_filter :authenticate_user!, :except => [:index, :show]
                # :destroy requires admin, see method body

  def new
    self.page = Page.new(title: params[:page_title]).decorate
    render :new
  end

  def create
    page = Page.new(page_params.merge(user: current_user))
    if page.save
      redirect_to page_url(page)
    else
      self.page = page.decorate
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    success = true
    Page.transaction do
      if need_to_update?
        success = page.update_attributes(page_params.merge(user:current_user))
      end
    end
    if success
      redirect_to page_url(page)
    else
      render :edit
    end
  rescue ActiveRecord::StaleObjectError
    flash.now[:warning] =
      'Another user has made a conflicting change, you can resolve the differences and save the page again'
    page.reload
    @conflict = Page.new(page_params)
    render :edit_with_conflicts
  end

  def destroy
    authorize_action_for page
    page.destroy
    redirect_to pages_path
  end

  def subscribe
    page.subscribe(current_user)
    redirect_to page_path(page)
  end

  def unsubscribe
    page.unsubscribe(current_user)
    redirect_to page_path(page)
  end

  def unsubscribe_via_email
    render :confirm_unsubscribe
  end

  def page_params
    params.require(:page).permit(:categories,
                                 :content,
                                 :creator,
                                 :lock_version,
                                 :slug,
                                 :tags,
                                 :title)
  end

  private

  def need_to_update?
        page.title      != page_params[:title]      ||
        page.categories != page_params[:categories] ||
        page.tags       != page_params[:tags]       ||
        page.content    != page_params[:content]
  end

end