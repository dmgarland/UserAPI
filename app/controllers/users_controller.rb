require 'pry-byebug'
class UsersController < ApplicationController

  before_action :find_user, :only => [:show, :update, :destroy]


  def index
    @users = User.all
  end

  def show
    render json: @user
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def find_user
    @user = User.find(params[:id])
  end
end