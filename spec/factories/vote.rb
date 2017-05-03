FactoryGirl.define do
  factory :vote do
    vote_type 'like'
    association :user
    association :photo
  end
end
