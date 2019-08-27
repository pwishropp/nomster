class Place < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: { maximum: 50, minimum: 3}
  validates :description, :address, presence: true

end
