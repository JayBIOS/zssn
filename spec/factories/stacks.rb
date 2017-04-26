FactoryGirl.define do
  factory :stack do
    quantity 1
    item

    trait :unquantified do
      quantity nil
    end

    trait :unknown do
      item nil
    end
  end
end
