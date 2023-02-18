class Book < ApplicationRecord
  validates :title, presence: true
  has_many :reservations
end
