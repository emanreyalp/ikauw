require 'rails_helper'

RSpec.describe "Seasons", type: :request do
  describe "GET /seasons" do
    let!(:first_season) { create(:season, :with_episodes) }
    let!(:second_season) { create(:season, :with_episodes) }
    let!(:third_season) { create(:season, :with_episodes) }

    before { get seasons_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'get the right data' do
      json = JSON.parse(response.body)

      response_contents_ids = json['data'].map{ |d| d['id'].to_i }

      expect(response_contents_ids).to match_array(Season.all.pluck(:id))
    end

    it 'get the seasons ordered by creation date' do
      json = JSON.parse(response.body)

      prev_season_creation_time = json['data'].first['attributes']['created_at'].to_datetime

      json['data'].each do |season|
        expect(season['attributes']['created_at'].to_datetime).to be >= prev_season_creation_time
      end
    end

    it 'get the episodes ordered by the number of in the season' do
      json = JSON.parse(response.body)
      episodes_meta = json['data'].first['relationships']['episodes']
      included_data = json['included']

      previous_episode_number = -1
      type = 'episode'

      episodes_meta['data'].each do |id_and_type|
        expect(id_and_type['type']).to eq(type)

        id = id_and_type['id']

        episode = included_data.find{ |d| d['id'] == id && d['type'] == type }
        episode_number = episode['attributes']['number']

        expect(episode_number).to be > previous_episode_number

        previous_episode_number = episode_number
      end
    end
  end
end
