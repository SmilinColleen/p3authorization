class User < ActiveRecord::Base
  include BCrypt

  validates_presence_of :name, :email
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    if new_password.length < 6
      raise ArgumentError
    end
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end
end
