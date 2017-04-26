FactoryGirl.define do
  factory :survivor, aliases: [:by, :infected] do
    name 'Foo'
    age 20
    gender 'male'
    latitude 5.231
    longitude 6.512

    after :build do |survivor|
      build :inventory, survivor: survivor
    end

    trait :unnamed do
      name nil
    end

    trait :unborn do
      age nil
    end

    trait :gender_neutral do
      gender nil
    end

    trait :empty_handed do
      after :build do |survivor|
        survivor.inventory = nil
      end
    end

    trait :infected do
      after :build do |survivor|
        reports = build_list(:report, 3, infected: survivor)
        survivor.reports << reports
      end
    end
  end
end
