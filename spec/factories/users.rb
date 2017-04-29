FactoryGirl.define do
  factory :user do
    email       { FFaker::Internet.email }
    password    { FFaker::Internet.password }
    password_confirmation { password }

    trait :invalid do
      email ''
      password ''
    end
  end
end
