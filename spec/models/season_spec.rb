require 'rails_helper'

RSpec.describe Season, type: :model do
  it 'is invalid without title' do
    season = build(:season, title: nil)

    expect(season).to be_invalid
    expect { season.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is invalid without plot' do
    season = build(:season, plot: nil)

    expect(season).to be_invalid
    expect { season.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is valid with valid attributes' do
    season = build(:season)

    expect(season).to be_valid
    expect { season.save! }.not_to raise_error
  end
end
