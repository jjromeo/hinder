class Vote < ApplicationRecord
  VOTING_COOLDOWN = 6.hours

  belongs_to :user
  belongs_to :photo

  validates_inclusion_of :vote_type, in: ['like', 'dislike']
  validates_presence_of :vote_type

  scope :recent, -> { where(created_at: (Time.now - VOTING_COOLDOWN)..Time.now) }
end
