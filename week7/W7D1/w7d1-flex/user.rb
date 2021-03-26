class User < ApplicationRecord 
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true

  attr_reader :password

  # immediately after we call User.new()
  after_initialize :ensure_session_token

  ## before_validation 
  # invoked when we call user.save

  # SPIRE 

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user && user.is_password?(password)
      return user
    else
      return nil
    end

  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
    # BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
    # during login sesion[:session_token] = user.reset_session_token!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end