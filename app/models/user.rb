class User < ApplicationRecord
  has_many :lendings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, [:admin, :user]
end
