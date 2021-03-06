require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe PurchasesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Purchase. As you add validations to Purchase, be sure to
  # adjust the attributes here as well.
  let(:valid_purchase_attributes) {
    {
      user_id: create(:user).id,
      purchase_option_id: create(:purchase_option).id
    }
  }

  let(:invalid_purchase_attributes) {
    {
      user_id: nil,
      purchase_option_id: nil
    }
  }

  let!(:content) { create(:movie) }

  let(:valid_params) {
    {
      content_id: content.id,
      purchase: valid_purchase_attributes
    }
  }

  let(:invalid_params) {
    {
      content_id: content.id,
      purchase: invalid_purchase_attributes
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PurchasesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Purchase" do
        expect {
          post :create, params: valid_params, session: valid_session
        }.to change(Purchase, :count).by(1)
      end

      it "renders a JSON response with the new purchase" do
        post :create, params: valid_params, session: valid_session

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to eq(Purchase.last.to_json)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new purchase" do
        post :create, params: invalid_params, session: valid_session

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with exist purchase' do
      it 'try renew it' do
        freeze_time do
          travel_to 3.days.ago

          post :create, params: valid_params
          expect(response).to have_http_status(:created)

          purchase_id = JSON.parse(response.body)['id']
          expiration_date_earlier = Purchase.find(purchase_id).expiration_date

          travel_to Time.now + 3.days

          post :create, params: valid_params
          expect(response).to have_http_status(:ok)

          expiration_date_now = Purchase.find(purchase_id).expiration_date
          expect(expiration_date_earlier + 3.day).to eq(expiration_date_now)
        end
      end
    end
  end
end
