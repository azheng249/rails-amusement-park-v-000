class UsersController < ApplicationController

  # GET /users/:id - user_path
  def show
    @user = User.find(params[:id])
    redirect_to user_path(current_user), alert: {error: "This is not your profile page."} if @user != current_user
  end

  # GET /users/new - new_user_path
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  # GET /users/:id/edit - edit_user_path
  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user), alert: {error: "This is not your profile page."} if @user != current_user
  end

  # PATCH/PUT /users/:id
  def update
    @user = User.find(params[:id])
    redirect_to user_path(current_user), alert: {error: "This is not your profile page."} if @user != current_user

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :tickets, :nausea, :happiness, :height, :admin)
  end
end