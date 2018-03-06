class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :password, length: { minimum: 4 }
  validates :email, uniqueness: { case_sensitive: false }


  def authenticate_with_credentials(email, password)
    spacefree_email = email.downcase.gsub(/ /, '')
    user = User.find_by_email(spacefree_email)
    if user && user.authenticate(password)
      return user
    else
      return false
    end
  end
end



