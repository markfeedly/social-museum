class UsersController < ApplicationController
  expose (:user){User.find(params[:id])}

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    flash[:notice] = ['Signed out successfully']
    sign_out @user
    redirect_to root_path
  end

  def sign_in

  end




#TODO Either scrap this or implement?
=begin
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
=end
end