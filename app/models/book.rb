class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  mount_uploader :cover_image, CoverImageUploader
end
