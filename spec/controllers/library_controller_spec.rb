require 'rails_helper'

include ActionView::Helpers::DateHelper

RSpec.describe LibraryController, type: :controller do
  describe "GET #index" do
    context 'with active purchases' do
      it 'return with json response' do
        user = create(:user, :who_purchased_contents)
        get :index, params: { user_id: user.id }

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end

    end

    context 'with an expired purchase' do
      it 'doesnt show the inactive purchase\'s content' do
        user = create(:user, :who_purchased_contents, :who_has_expired_purchase)

        get :index, params: { user_id: user.id }

        response_body = JSON.parse(response.body)
        purchases_ids = response_body['data'].map{ |r| r['id'].to_i }

        Purchase.where(id: purchases_ids).each do |purchase|
          expect(purchase.user).to eq(user)
          expect(purchase.remaining_time_in_days.positive?).to be(true)
        end
      end
    end
  end
end
