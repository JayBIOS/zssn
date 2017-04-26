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

  it 'should not be infected' do
    survivor = build :survivor
    expect(survivor.infected?).to be_falsey
  end

  it 'must have an inventory' do
    survivor = build :survivor, :empty_handed
    expect(survivor).to_not be_valid
  end

  context 'with 3 reports or more' do
    let(:survivor) { build :survivor, :infected }
    it 'should be infected' do
      expect(survivor.infected?).to be_truthy
    end
  end
end
