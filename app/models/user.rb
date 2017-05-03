class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos
  has_many :votes

  # Grab only recent photos associated through a vote
  has_many :recently_voted_on_photos, ->{ Vote.recent }, through: :votes, source: :photo

  def voted_on_ids
    recently_voted_on_photos.pluck(:id).uniq
  end
end
