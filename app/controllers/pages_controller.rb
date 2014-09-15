class PagesController < ApplicationController
  respond_to :html
  expose(:page, attributes: :page_params, finder: :find_by_slug) {|default| default.decorate }
  expose(:pages)
  expose(:page_states) { Kaminari.paginate_array(page.history.to_a.reverse).page(params[:page_states]).per(5) }
  expose(:page_summaries) { pages.joins(:page_title).order('titles.title ASC').page(params[:page_summaries]).per(10) }

  before_action :authenticate_user!, :except => [:index, :show]
                # :destroy requires admin, see method body

  authorize_actions_for :page

  def new
    page.build_page_title
    respond_with(page)
  end

  def create
    page.user_id = current_user.id
    page.save
    respond_with(page)
  end

  def index
    respond_with(pages)
  end

  def show
    respond_with(page)
  end

  def edit
    respond_with(page)
  end

  def update
    page.update_attributes(page_params.merge(user_id: current_user.id))
    respond_with(page)
  rescue ActiveRecord::StaleObjectError
    flash.now[:warning] =
      'Another user has made a conflicting change, you can resolve the differences and save the page again'
    page.reload
    @conflict = Page.new(page_params)
    render :edit_with_conflicts
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

  def unsubscribe_via_email
    render :confirm_unsubscribe
  end

  private

  def page_params
    params.require(:page).permit(:categories,
                                 :content,
                                 :creator,
                                 :lock_version,
                                 :slug,
                                 :tags,
                                 page_title_attributes: [:title, :id])
  end
end