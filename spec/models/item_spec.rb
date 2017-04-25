require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'must be valid' do
    item = build :item
    expect(item).to be_valid
  end

  it 'must have a name' do
    item = build :item, :unnamed
    expect(item).to_not be_valid
  end

  it 'must have a value' do
    item = build :item, :unvalued
    expect(item).to_not be_valid
  end
end
