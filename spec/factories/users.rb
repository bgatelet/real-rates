FactoryGirl.define do
  factory :user do
    email       { FFaker::Internet.email }
    password    { FFaker::Internet.password }
    password_confirmation { password }

    after(:build) do |user|
      user.list ||= FactoryGirl.build(:list, :user => user)
    end

    trait :invalid do
      email ''
      password ''
    end
  end
end
