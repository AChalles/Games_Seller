class CheckoutController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if !params[:province] || params[:province].blank?
      if current_user && !current_user.blank? && !current_user.province_id.nil?
        params[:province] = current_user.province_id
      else
        params[:province] = 0
      end
    end
    @tax_percent = update_tax()
  end

  def show
    item_list = []

    session[:cart_id].each_with_index do |i, index|
      item = Game.find(i)
      item_list.append(
      {
        price_data: {
          currency: 'cad',
          unit_amount: item.price,
          product_data: {
            name: item.name,
          },
          tax_behavior: 'exclusive',
        },
        quantity: session[:cart_quantity][index]
      })
    end

    domain = "http://localhost:3000/"
    Stripe.api_key = "sk_test_51M4ZdDE69JA1nsv1EMLUX2G7rpyJHkS7CnWPBsWcJZh9kFocuus6Ulw0YED808WfVzMQwBstpoYxKWfaGRUrtk1z00tHYaXq0w"
    session = Stripe::Checkout::Session.create({
      # line_items: [{
      #   price: 'price_1MDiKQE69JA1nsv1boNdCngc',
      #   quantity: 1,
      # }],
      line_items: item_list,
      mode: 'payment',
      success_url: domain + 'success',
      cancel_url: domain,
      shipping_address_collection: {allowed_countries: ['CA']},
      automatic_tax: {enabled: true},
    })
    redirect_to session.url, allow_other_host: true
  end

  private
  def update_tax
    province = Province.find(params[:province])

    return province.hst + province.gst + province.pst
  end
end
