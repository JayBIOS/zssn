FactoryGirl.define do
  factory :item do
    name 'Test Item'
    value 1

    trait :unnamed do
      name nil
    end

    trait :unvalued do
      value nil
    end

    factory :water, parent: :item do
      name 'Water'
      value 4
    end
  end
end
