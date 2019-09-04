class Photo < ApplicationRecord
  belongs_to :place
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :caption, presence: true, length: { maximum: 140, minimum: 3}
  validates :picture, presence: true
end
