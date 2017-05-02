FactoryGirl.define do
  sequence :email do
    Faker::Internet.email
  end

  factory :user do
    email { generate :email }
    password 'password'
    password_confirmation 'password'
  end
end
