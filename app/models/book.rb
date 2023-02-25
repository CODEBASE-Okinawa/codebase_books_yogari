class Book < ApplicationRecord
  has_one :lending, -> { where(return_status: false) }
  has_many :lendings, dependent: :destroy
  has_many :lend_active, -> { where(return_status: false) }, class_name: 'Lending'
  has_many :reservations
  has_many :reservation_active, -> { where(reservation_at: Date.today..Float::INFINITY)}, class_name: 'Reservation'
  has_one_attached :image

  validates :title, presence: true

  delegate :created_at, :return_at, :user, to: :lending
end