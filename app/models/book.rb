class Book < ApplicationRecord
  validates :title, presence: true
  mount_uploader :cover_image, CoverImageUploader
  has_many :reservations
end
