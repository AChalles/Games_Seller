class CompaniesController < ApplicationController
  def index
    @genres = Genre.all
    @companies = Company.order(name: :asc).page(params[:page])

  end

  def show
    @genres = Genre.all
    @company = Company.find(params[:id])
    @games = Game.where("company_id LIKE ?", params[:id]).order(name: :asc).page(params[:page])
  end
end
