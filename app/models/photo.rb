class Photo < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  has_attached_file :image

  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
    size: { in: 0..10.megabytes }
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  scope :not_belonging_to, -> (user) { where.not(user_id: user.id) }
  scope :for_voting, ->(user) { not_belonging_to(user).where.not(id: user.voted_on_photo_ids) }
end
