class Lending < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #未返却の本を抽出
  scope :return_false, -> { where(return_status: false) }
end
