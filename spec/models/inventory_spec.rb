require 'rails_helper'

RSpec.describe Inventory, type: :model do
  it 'must be valid' do
    inventory = build :inventory
    expect(inventory).to be_valid
  end

  it 'belongs to a survivor' do
    inventory = build :inventory, :not_owned
    expect(inventory).to_not be_valid
  end

  it 'may have stacks' do
    inventory = create :inventory, :with_stacks
    expect(inventory.stacks.length).to eq(5)
  end
end
