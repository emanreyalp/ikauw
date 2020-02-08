require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it "can't be beloging to an Episode" do
    purchase = build(:purchase, content: create(:episode))

    expect(purchase).not_to be_valid
  end

  it 'invalid without user' do
    purchase = build(:purchase, user: nil)

    expect(purchase).to be_invalid
    expect { purchase.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is invalid without content' do
    purchase = build(:purchase, content: nil)

    expect(purchase).to be_invalid
    expect { purchase.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is invalid without purchase option' do
    purchase = build(:purchase, purchase_option: nil)

    expect(purchase).to be_invalid
    expect { purchase.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is valid with valid attributes' do
    purchase = build(:purchase)

    expect(purchase).to be_valid
    expect { purchase.save! }.not_to raise_error
  end

  it 'cant be duplicated with the same user, content and purchase option' do
    purchase = create(:purchase)
    purchase_hash = {
      user: purchase.user,
      content: purchase.content,
      purchase_option: purchase.purchase_option
    }

    duplicated_purchase = build(:purchase, purchase_hash)

    expect(duplicated_purchase).to be_invalid
    expect { duplicated_purchase.save! }.to raise_error ActiveRecord::RecordInvalid
  end
end
