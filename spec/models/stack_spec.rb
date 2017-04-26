require 'rails_helper'

RSpec.describe Stack, type: :model do
  it 'must be valid' do
    stack = build :stack
    expect(stack).to be_valid
  end

  it 'must quantified' do
    stack = build :stack, :unquantified
    expect(stack).to_not be_valid
  end

  it 'must have an item' do
    stack = build :stack, :unknown
    expect(stack).to_not be_valid
  end

  it 'belongs to an inventory' do
    stack = build :stack, :unstored
    expect(stack).to_not be_valid
  end
end
