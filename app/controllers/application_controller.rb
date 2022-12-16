include ActionView::Helpers::NumberHelper
class ApplicationController < ActionController::Base
  before_action :initialize_genres
  before_action :initialize_session
  before_action :load_cart
  before_action :configure_permitted_parameters, if: :devise_controller?



  def add_to_cart
    id = params[:id].to_i
    quantity = 1
    if session[:cart_id].include?(id)
      index = session[:cart_id].index(id)
      session[:cart_quantity][index] += 1
    else
      session[:cart_quantity] << quantity
      session[:cart_id] << id
    end

    redirect_to root_path
  end

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
    else
      @cart_id = []
      @cart_quantity = []
    end
  end


  protected

  def calculate_tax(province, total)
    prov = Province.find(province)
    tax = (prov.gst * total) + (prov.hst * total) + (prov.pst * total)
    number_with_precision(tax, precision: 0).to_i

  end

  def configure_permitted_parameters
    attributes = [:province_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end


end
