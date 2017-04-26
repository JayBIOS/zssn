FactoryGirl.define do
  factory :survivor do
    name 'Foo'
    age 20
    gender 'male'
    latitude 5.231
    longitude 6.512

    trait :unnamed do
      name nil
    end

    trait :unborn do
      age nil
    end

    trait :gender_neutral do
      gender nil
    end

    trait :hidden do
      latitude nil
      longitude nil
    end
  end
end
