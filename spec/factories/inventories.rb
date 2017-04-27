FactoryGirl.define do
  factory :inventory do
    survivor

    trait :not_owned do
      survivor nil
    end

    trait :with_stacks do
      after :build do |inventory|
        inventory.stacks << build_list(:stack_of_water, 5, inventory: inventory)
      end
    end
  end
end
