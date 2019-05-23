# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Library', type: :request do
  describe 'GET /library' do
    let(:user) { create(:user, :who_purchased_contents) }

    before do
      get user_library_index_path(user.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains user's contents" do
      json_response = JSON.parse(response.body)

      response_contents_ids = json_response.map { |r| r['id'] }
      expect(response_contents_ids).to match_array(user.content_ids)
    end
  end
end
