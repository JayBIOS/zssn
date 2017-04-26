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
end
