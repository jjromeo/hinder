class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :messages, dependent: :destroy

  # Grab only recent photos_ids of photos a user has voted on
  def voted_on_photo_ids
    votes.recent.pluck(:photo_id).uniq
  end
end
