class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :password, length: { minimum: 4 }
  validates :email, uniqueness: { case_sensitive: false }
end
