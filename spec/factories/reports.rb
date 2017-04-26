FactoryGirl.define do
  factory :report do
    infected
    by

    trait :with_no_target do
      infected nil
    end

    trait :by_no_one do
      by nil
    end
  end
end
