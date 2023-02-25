class Book < ApplicationRecord
  has_one :lending, -> { where(return_status: false) }
  has_many :lendings, dependent: :destroy
  has_many :reservations
  has_one_attached :image

  validates :title, presence: true

  delegate :created_at, :return_at, :user, to: :lending
end