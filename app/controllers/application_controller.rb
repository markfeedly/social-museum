require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :store_location, unless: :devise_controller?

  def current_user
    super || User.new
  end

  def commentable
    case params['comment']['commentable_type']
      when 'CollectionItem'
        collection_item
      when 'Page'
        page
      when 'Resource'
        resource
      else
        raise
    end
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if request.get? && !request.xhr?
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to  user_session_path, alert: 'You need to be sign in below before you can do that, or, alternately, click the back button to get back to where you wee and continue browsing'
  end
end