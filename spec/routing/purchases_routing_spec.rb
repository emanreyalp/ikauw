require "rails_helper"

RSpec.describe PurchasesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/contents/1/purchases").to route_to("purchases#create", content_id: '1')
    end
  end
end
