FactoryGirl.define do
  factory :survivor do
    name 'Foo'
    age 20
    gender 'male'
    latitude 5.231
    longitude 6.512

    after :build do |survivor|
      build :inventory, :with_stacks, survivor: survivor
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
      transient do
        reports_count 3
      end

      after :build do |survivor, evaluator|
        survivor.reports << build_list(:report, evaluator.reports_count,
                                       infected: survivor)
      end
    end
  end
end
