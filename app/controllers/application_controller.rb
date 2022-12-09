class ApplicationController < ActionController::Base
  before_action :initialize_genres
  before_action :initialize_session
  before_action :load_cart
  before_action :require_login
  helper_method :current_user

  def require_login
    redirect_to new_session_path unless session.include? :user_id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def remove_from_cart
    id = params[:id].to_i
    iteration = 0
    count = 0
    index = session[:cart_id].index(id)
    session[:cart_quantity].delete_at(index)
    session[:cart_id].delete(id)
    redirect_to root_path and return
  end

  def remove_quantity_from_cart
    id = params[:id].to_i
    index = session[:cart_id].index(id)
    if session[:cart_quantity][index] != 1
      session[:cart_quantity][index] -= 1
      return redirect_to root_path
    else
      session[:cart_quantity].delete_at(index)
      session[:cart_id].delete_at(index)
      redirect_to root_path and return
    end

  end

  private
  def initialize_genres
    @nav_genres = Genre.all
  end

  def initialize_session
    session[:cart_id] ||= []
    session[:cart_quantity] ||= []
  end

  def load_cart
    if !session[:cart_id].blank? && !session[:cart_id].empty?
      @cart_id = Game.find(session[:cart_id])
      @cart_quantity = session[:cart_quantity]
    end
  end


end
