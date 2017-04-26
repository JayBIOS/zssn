FactoryGirl.define do
  factory :inventory do
    survivor

    trait :not_owned do
      survivor nil
    end

    trait :with_stacks do
      after :create  do |inventory|
        create_list(:stack, 5, inventory: inventory)
      end
    end
  end
end
