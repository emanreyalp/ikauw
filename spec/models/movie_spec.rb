require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'invalid without title' do
    movie = build(:movie, title: nil)

    expect(movie).to be_invalid
    expect { movie.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is invalid without plot' do
    movie = build(:movie, plot: nil)

    expect(movie).to be_invalid
    expect { movie.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is valid with valid attributes' do
    movie = build(:movie)

    expect(movie).to be_valid
    expect { movie.save! }.not_to raise_error
  end
end
