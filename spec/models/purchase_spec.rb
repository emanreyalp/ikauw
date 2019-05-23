require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "can't be beloging to an Episode" do
    purchase = build(:purchase, content: create(:episode))

    expect(purchase).not_to be_valid
  end
end
