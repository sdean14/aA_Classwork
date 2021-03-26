class User < ApplicationRecord

  has_many :goals
    # foreign_key: :user_id,
    # class_name: :Goal

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  attr_reader :password, :username

  after_initialize :ensure_session_token

  def is_password?(password)
   BCrypt::Password.create(password).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.base64(64)
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil 
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.base64(64)
  end

end
