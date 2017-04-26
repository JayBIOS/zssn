require 'rails_helper'

RSpec.describe Survivor, type: :model do
  it 'must be valid' do
    survivor = build :survivor
    expect(survivor).to be_valid
  end

  it 'must have a name' do
    survivor = build :survivor, :unnamed
    expect(survivor).to_not be_valid
  end

  it 'must have an age' do
    survivor = build :survivor, :unborn
    expect(survivor).to_not be_valid
  end

  it 'must have a gender' do
    survivor = build :survivor, :gender_neutral
    # Did you just assume his gender?
    expect(survivor).to_not be_valid
  end

  it 'must have the last location' do
    survivor = build :survivor, :hidden
    expect(survivor).to_not be_valid
  end
end
