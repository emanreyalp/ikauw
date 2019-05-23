require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'GET /movies' do
    before do
      3.times { create(:movie) }

      get movies_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the right data' do
      json = JSON.parse(response.body)

      response_movies_ids = json['data'].map{ |d| d['id'].to_i }

      expect(response_movies_ids).to match_array(Movie.all.pluck(:id))
    end

    it 'returns ordered by creation date' do
      json = JSON.parse(response.body)

      prev_movie_creation_time = json['data'].first['attributes']['created_at'].to_datetime

      json['data'].each do |movie|
        expect(movie['attributes']['created_at'].to_datetime).to be >= prev_movie_creation_time
      end
    end
  end
end
