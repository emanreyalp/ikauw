require 'rails_helper'

RSpec.describe Content, type: :model do
  it 'should raise error when initializing' do
    expect { build(:content) }.to raise_error
  end
end
