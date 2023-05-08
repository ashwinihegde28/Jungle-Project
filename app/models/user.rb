class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: {minimum: 5}, presence: true
  validates :password_confirmation, presence: true, length: { minimum: 5 }


  def self.authenticate_with_credentials(email,password)
    user = User.find_by_email(email.delete(' ').downcase)
      if user && user.authenticate(password)
        return user
      end
    nil
  end

end
