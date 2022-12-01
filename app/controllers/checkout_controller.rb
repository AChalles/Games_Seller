class CheckoutController < ApplicationController
  def create
    @game = Game.find(params[:id])

    if @game.nil?
      redirect_to root_path
      return
    end

    #setting up a stripe session for payment.

    respond_to do |format|
      format.js # render create.js.erb
    end
  end

  def success

  end

  def cancel

  end
end
