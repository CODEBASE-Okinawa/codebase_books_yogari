class Book < ApplicationRecord
  has_many :lendings, dependent: :destroy
  has_many :reservations
  has_one_attached :image

  def is_lending?
    lendings.pluck(:return_status).include?(false) ? true : false
  end

  def lending_start_at
    lendings.find_by(return_status: false).created_at
  end

  def lending_end_at
    lendings.find_by(return_status: false).return_at
  end

  def lending_user
    lendings.find_by(return_status: false).user
  end
end
