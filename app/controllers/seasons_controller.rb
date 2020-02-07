class SeasonsController < ApplicationController
  # GET /seasons
  def index
    @seasons = Season.all.order(:created_at)

    render json: SeasonSerializer.new(@seasons, { include: [:episodes] }).serialized_json
  end
end
