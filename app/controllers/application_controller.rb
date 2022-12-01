class ApplicationController < ActionController::Base
  before_action :initialize_genres
  before_action :initialize_session
  before_action :load_cart

  def remove_from_cart
    id = params[:id].to_i
    iteration = 0
    count = 0
    session[:cart_id].each do |c|
      if c = id
        count = iteration
      end
      iteration += 1
    end
    quantity = session[:cart_quantity][count]
    session[:cart_quantity].delete(quantity)
    session[:cart_id].delete(id)
    redirect_to root_path
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
