class User < ApplicationRecord
  has_many :lendings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, [:admin, :user]

  def lending_books
    Lending.where("user_id = ?", id)
  end
end
