require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without email' do
    user = build(:user, email: nil)

    expect(user).to be_invalid
    expect { user.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is valid with valid attributes' do
    user = build(:user)

    expect(user).to be_valid
    expect { user.save! }.not_to raise_error
  end
end
