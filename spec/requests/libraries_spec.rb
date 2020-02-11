# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Library', type: :request do
  include ActiveSupport::Testing::TimeHelpers
  describe 'GET /library' do
    let(:user) { create(:user, :who_purchased_contents) }

    before do
      get library_index_path(user_id: user.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains user's purchases" do
      json = JSON.parse(response.body)

      response_purchases_ids = json['data'].map{ |d| d['id'].to_i }

      expect(response_purchases_ids).to match_array(user.purchases.active.pluck(:id))
    end

    it "isn't containt a purchase if that is expired" do
      json = JSON.parse(response.body)
      expect(json['data']).not_to be_empty

      travel_to(Time.now + Purchase::ACTIVATION_PERIOD_TIME + 1.second) do
        get library_index_path(user_id: user.id)
        expect(response).to have_http_status(:success)

        json = JSON.parse(response.body)
        expect(json['data']).to be_empty
      end
    end

    it 'returns ordered by remaining time' do
      json = JSON.parse(response.body)

      prev_remaining_time = json['data'].first['attributes']['remaining_time_in_days'].to_f

      json['data'].each do |content|
        remaining_time = content['attributes']['remaining_time_in_days'].to_f

        expect(remaining_time).to be >= prev_remaining_time

        prev_remaining_time = remaining_time
      end
    end
  end
end
