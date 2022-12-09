require 'bcrypt'

class UserController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  include BCrypt

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def new
    @user = User.new
  end



  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Error- please try to create an account again."
      redirect_to user_new_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password_digest, :password_confirmation, :province, :user_bio, :favourite_game, :favourite_genre)
  end
end
