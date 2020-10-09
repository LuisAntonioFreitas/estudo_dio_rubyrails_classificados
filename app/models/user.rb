class User < ApplicationRecord
  # has_secure_password

  EMAIL_FORMAT = /[^\s]@[^\s]/

  validates :name, presence: true
  validates :email, presence: true, format: {with: EMAIL_FORMAT }, uniqueness: true
  validates :password, presence: true

  has_many :ads
end
