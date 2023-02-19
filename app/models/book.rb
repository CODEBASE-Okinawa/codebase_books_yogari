class Book < ApplicationRecord
  has_many :lendings, dependent: :destroy
  validates :title, presence: true
  has_many :reservations
end
