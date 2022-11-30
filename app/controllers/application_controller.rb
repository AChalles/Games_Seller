class ApplicationController < ActionController::Base
  before_action :initialize_genres


  private
  def initialize_genres
    @genres = Genre.all
  end
end
