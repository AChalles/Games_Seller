class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @companies = Company.order(name: :asc).page(params[:page])

  end

  def show
    @company = Company.find(params[:id])
    @games = Game.where("company_id LIKE ?", params[:id]).order(name: :asc).page(params[:page])
  end
end
