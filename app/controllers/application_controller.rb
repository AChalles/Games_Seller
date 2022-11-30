class ApplicationController < ActionController::Base
  before_action :initialize_genres
  before_action :initialize_session
  before_action :load_cart

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  private
  def initialize_genres
    @genres = Genre.all
  end

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    if !session[:cart].blank? &&!session[:cart].empty?
      @cart = Game.find(session[:cart])
    end
  end


end
