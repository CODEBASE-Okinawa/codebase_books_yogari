class Book < ApplicationRecord
  has_many :lendings, dependent: :destroy
  validates :title, presence: true
end
