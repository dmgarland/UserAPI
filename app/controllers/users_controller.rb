require 'pry-byebug'
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
    # respond_with @user, json: @user
  end

  def delete

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end