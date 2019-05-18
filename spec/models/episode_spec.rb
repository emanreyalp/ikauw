require 'rails_helper'

RSpec.describe Episode, type: :model do
  it 'should be invalid without number' do
    episode = build(:episode, number: nil)
    expect { episode.save! }.to raise_error ActiveRecord::RecordInvalid
  end
end
