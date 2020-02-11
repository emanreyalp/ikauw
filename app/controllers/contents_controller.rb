class ContentsController < ApplicationController
  # GET /contents
  def index
    @contents = Content.movies_and_seasons.all

    render json: ContentSerializer.new(@contents)
  end
end
