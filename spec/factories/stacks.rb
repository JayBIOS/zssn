FactoryGirl.define do
  factory :stack do
    quantity 1
    item
    inventory

    trait :unquantified do
      quantity nil
    end

    trait :unknown do
      item nil
    end

    trait :unstored do
      inventory nil
    end
  end

  factory :stack_of_water, parent: :stack do
    association :item, factory: :water
  end
end
