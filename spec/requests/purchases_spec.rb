# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Purchases', type: :request do
  describe 'GET /purchases' do
    it 'works! (now write some real specs)' do
      get purchases_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /purchases' do
    let(:purchase) { create(:purchase) }
    it 'should create purchase with new data' do
      new_attributes = {
        user_id: create(:user).id, # this have to be elsewhere
        content_id: create(:movie).id,
        purchase_option_id: create(:purchase_option).id
      }

      post content_purchases_path(purchase.content.id), params: { purchase: new_attributes }
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq('application/json')
    end

    it "can't purchase again if it's already exists" do
      exsisted_attributes = {
        user_id: purchase.user.id, # this have to be elsewhere
        content_id: purchase.content.id,
        purchase_option_id: purchase.purchase_option.id
      }

      expect(Purchase.where(exsisted_attributes).count).to eq(1)

      post content_purchases_path(purchase.content.id), params: { purchase: exsisted_attributes }

      expect(Purchase.where(exsisted_attributes).count).to eq(1)

      expect(response).to have_http_status(:not_acceptable)
      expect(response.content_type).to eq('application/json')
    end
  end
end
