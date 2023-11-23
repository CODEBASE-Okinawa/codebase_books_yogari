class User < ApplicationRecord
# Include default devise modules.
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable
include DeviseTokenAuth::Concerns::User

  enum :role, [:admin, :user]

  has_many :lendings, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
