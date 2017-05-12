FactoryGirl.define do
  factory :currency do
    code "MyString"

    trait :invalid do
      code ''
    end
  end
end
