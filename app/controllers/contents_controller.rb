class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :update, :destroy]

  # GET /contents
  def index
    @contents = Content.movies_and_seasons.all

    render json: ContentSerializer.new(@contents)
  end
end
