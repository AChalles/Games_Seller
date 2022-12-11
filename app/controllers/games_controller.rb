class GamesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_game, only: %i[ show add_to_cart ]
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index]
  before_action :load_cart
  # GET /games or /games.json
  def index
    @games = Game.order(name: :asc).page(params[:page])
  end

  # GET /games/1 or /games/1.json
  def show
  end





  def search
    search_param = "%#{params[:keywords]}%"
    if params[:genres].blank? && params[:keywords].blank?
    redirect_to root_path and return
    elsif params[:genres].blank?
      @games = Game.where("lower(name) LIKE ? OR lower(description) LIKE ?", search_param, search_param )
    elsif params[:keywords].blank?
      @games = Game.where(genre_id: params[:genres])
    else
      @games = Game.where(genre_id: params[:genres]).where("lower(name) LIKE ? OR lower(description) LIKE ?", search_param, search_param )
    end
  end
  # GET /games/new
  # def new
  #   @game = Game.new
  #   @genre = Genre.all.map{|g| [ g.name, g.id ] }
  # end

  # GET /games/1/edit
  # def edit
  #   @game = Game.find(params[:id])
  #   @genre = Genre.all.map{|g| [ g.name, g.id ] }
  # end

  # POST /games or /games.json
  # def create
  #   @game = Game.new(game_params)

  #   respond_to do |format|
  #     if @game.save
  #       format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
  #       format.json { render :show, status: :created, location: @game }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @game.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /games/1 or /games/1.json
  # def update
  #   respond_to do |format|
  #     if @game.update(game_params)
  #       puts @game
  #       format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
  #       format.json { render :show, status: :ok, location: @game }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @game.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /games/1 or /games/1.json
  # def destroy
  #   @game.destroy

  #   respond_to do |format|
  #     format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private

    def initialize_session
      session[:visit_count] ||= 0
    end

    def increment_visit_count
      session[:visit_count] += 1
      @visit_count = session[:visit_count]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name, :description, :publish_date, :price, :genre_id, :company_id)
    end
end
