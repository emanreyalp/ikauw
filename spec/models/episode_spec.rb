require 'rails_helper'

RSpec.describe Episode, type: :model do
  it 'should be invalid without number' do
    episode = build(:episode, number: nil)
    expect { episode.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'should be invalid without season' do
    episode = build(:episode, season: nil)
    expect { episode.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is invalid without title' do
    episode = build(:episode, title: nil)

    expect(episode).to be_invalid
    expect { episode.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is invalid without plot' do
    episode = build(:episode, plot: nil)

    expect(episode).to be_invalid
    expect { episode.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is valid with valid attributes' do
    episode = build(:episode)

    expect(episode).to be_valid
    expect { episode.save! }.not_to raise_error
  end
end
