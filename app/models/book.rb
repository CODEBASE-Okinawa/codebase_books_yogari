class Book < ApplicationRecord
  has_many :lendings, dependent: :destroy
  has_many :reservations
  has_one_attached :image
  validates :title, presence: true
end
