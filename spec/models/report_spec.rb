require 'rails_helper'

RSpec.describe Report, type: :model do
  it 'must be valid' do
    report = build :report
    expect(report).to be_valid
  end

  it 'must have an infected' do
    report = build :report, :with_no_target
    expect(report).to_not be_valid
  end

  it 'must have an reporter (by)' do
    report = build :report, :by_no_one
    expect(report).to_not be_valid
  end

  it 'must have a different target' do
    original_report = create :report
    new_report = build :report, infected: original_report.infected,
                                by: original_report.by
    expect(new_report).to_not be_valid
  end
end
