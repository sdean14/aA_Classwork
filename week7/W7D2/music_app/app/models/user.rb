class User < ApplicationRecord
  validates :email, :password_digest, presence: true, uniqueness: true
  validates :password_digest, length: { minimum: 6, allow_nil: true }
  
  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    token = SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.is_password?(password)
      return user
    else
      return nil
    end
  end

end
