class UsersController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted'
  end

  def show
  end

  def edit
  end

private

  def user_params
    params.require(:user).permit(:name, :hometown, :birthday, :password, :email)
  end

  def set_task
    @user = User.find(params[:id])
  end

end
