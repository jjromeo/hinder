class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  validates_inclusion_of :vote_type, in: ['like', 'dislike']
end
