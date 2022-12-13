class OrderController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    order = Order.find(params[:format])
    return unless order.user == current_user

    @order = order
  end
end
