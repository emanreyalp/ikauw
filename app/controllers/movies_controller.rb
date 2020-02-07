class MoviesController < ApplicationController
  # GET /movies
  def index
    @movies = Movie.all.order(:created_at)

    render json: MovieSerializer.new(@movies)
  end
end
