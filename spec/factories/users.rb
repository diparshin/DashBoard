FactoryGirl.define do
  factory :user do
    email Faker::Internet.email

    p = Faker::Lorem.sentence
    password p
    password_confirmation p
  end
end