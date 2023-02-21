class Lending < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #未返却の本を抽出
  scope :not_yet_returned, -> { where(return_status: false).order(return_at: :asc) }
end
