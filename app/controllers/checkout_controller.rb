class CheckoutController < ApplicationController


  def index
    @tax_percent = update_tax()
  end

  private
  def update_tax
    province = params[:province]
    puts province
    case province
    when "MB"
      @tax_percent = 0.13

    when "BC"
      @tax_percent = 0.12

    when "AB"
      @tax_percent = 0.05

    when "NB"
      @tax_percent = 0.15

    when "NL"
      @tax_percent = 0.15

    when "NT"
      @tax_percent = 0.05

    when "NS"
      @tax_percent = 0.15

    when "NU"
      @tax_percent = 0.05

    when "ON"
      @tax_percent = 0.13

    when "PE"
      @tax_percent = 0.15

    when "QC"
      @tax_percent = 0.14975

    when "SK"
      @tax_percent = 0.11

    when "YK"
      @tax_percent = 0.05

    else
      @tax_percent = 0
    end

  end
end
