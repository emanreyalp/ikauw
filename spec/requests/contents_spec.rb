require 'rails_helper'

RSpec.describe 'Contents', type: :request do
  describe 'GET /contents' do
    before do
      create(:movie)
      create(:season)

      get contents_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the right data' do
      json = JSON.parse(response.body)

      response_contents_ids = json['data'].map{ |d| d['id'].to_i }

      expect(response_contents_ids).to match_array(Content.movies_and_seasons.all.pluck(:id))
    end

    it 'returns ordered by creation date' do
      json = JSON.parse(response.body)

      prev_content_creation_time = json['data'].first['attributes']['created_at'].to_datetime

      json['data'].each do |content|
        expect(content['attributes']['created_at'].to_datetime).to be >= prev_content_creation_time
      end
    end
  end
end
