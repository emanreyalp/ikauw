require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  it 'invalid without price' do
    purchase_option = build(:purchase_option, price: nil)

    expect(purchase_option).to be_invalid
    expect { purchase_option.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is invalid without quality' do
    purchase_option = build(:purchase_option, quality: nil)

    expect(purchase_option).to be_invalid
    expect { purchase_option.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is valid with valid attributes' do
    purchase_option = build(:purchase_option)

    expect(purchase_option).to be_valid
    expect { purchase_option.save! }.not_to raise_error
  end
end
