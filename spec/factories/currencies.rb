FactoryGirl.define do
  factory :currency do
    code "MyString"
    rate 1.2432

    trait :invalid do
      code ''
    end
  end
end
