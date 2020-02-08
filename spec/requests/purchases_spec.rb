# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Purchases', type: :request do
  describe 'POST /purchases' do
    let(:purchase) { create(:purchase) }
    let(:user) { create(:user) }
    it 'should create purchase with new data' do
      content = create(:movie)
      new_attributes = {
        user_id: user.id,
        content_id: content.id,
        purchase_option_id: create(:purchase_option).id
      }

      expect_post_request = expect do
        post content_purchases_path(content.id), params: { purchase: new_attributes }
      end
      expect_post_request.to change { Purchase.where(new_attributes).count }.by(1)

      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq('application/json')
    end

    it "can't purchase again if it's already exists" do
      existed_attributes = {
        user_id: purchase.user.id,
        content_id: purchase.content.id,
        purchase_option_id: purchase.purchase_option.id
      }

      expect_post_request = expect do
        post content_purchases_path(purchase.content.id), params: { purchase: existed_attributes }
      end
      expect_post_request.to_not change { Purchase.where(existed_attributes).count }

      expect(response).to have_http_status(:not_acceptable)
      expect(response.content_type).to eq('application/json')
    end
  end
end
