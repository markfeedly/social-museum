class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :store_location

  # https://github.com/plataformatec/devise/wiki/How-To:-Redirect-back-to-current-page-after-sign-in,-sign-out,-sign-up,-update
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if request.path != new_user_registration_path    &&
       request.path != edit_user_registration_path   &&
       request.path != new_user_confirmation_path    &&
       request.path != new_user_session_path         &&
       request.path != cancel_user_registration_path &&
       request.path != new_user_password_path        &&
       request.path != edit_user_password_path       &&
       request.path != destroy_user_session_path     &&
      #request.path != new_user_path                 && TODO implement these pages
      #request.path != edit_user_path                &&
      !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
      Rails.logger.level = 0
      logger.debug "%%%%%%%%%%%%%%%%%%%%%%%%%%% store_location #{session[:previous_url]} %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    end
  end

  def after_sign_in_path_for(resource)
    Rails.logger.level = 0
    logger.debug "%%%%%%%%%%%%%%%%%%%%%%%%%%% after_sign_in_path_for #{session[:previous_url]} %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

    session[:previous_url] || root_path
  end

end