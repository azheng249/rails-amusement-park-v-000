class SessionsController < ApplicationController

  # GET new_session_path
  def new
    @users = User.all
  end

  # POST create_session_path
  def create
    @user = User.find_by(id: params[:user][:id])
    session[:user_id] = @user.id
    redirect_to @user
  end

  # DELETE destroy_session_path
  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end