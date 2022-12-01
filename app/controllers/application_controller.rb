class ApplicationController < ActionController::Base
  before_action :initialize_genres
  before_action :initialize_session
  before_action :load_cart

  def remove_from_cart
    id = params[:id].to_i
    iteration = 0
    count = 0
    session[:cart_id].each do |c|
      if c == id
        count = iteration
      end
      iteration += 1
    end
    session[:cart_quantity].delete_at(count)
    session[:cart_id].delete(id)
    redirect_to root_path and return
  end

  def remove_quantity_from_cart
    id = params[:id].to_i
    puts id
    iteration = 0
    count = 0
    session[:cart_id].each do |c|
      if c == id
        count = iteration
      end
      iteration += 1
    end
    if session[:cart_quantity][count] != 1
      session[:cart_quantity][count] -= 1
      return redirect_to root_path
    else
      session[:cart_quantity].delete_at(count)
      session[:cart_id].delete_at(count)
      redirect_to root_path and return
    end

  end

  private
  def initialize_genres
    @genres = Genre.all
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
