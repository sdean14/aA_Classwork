class User < ApplicationRecord
    validates :username, presence: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true

    attr_reader :password

    after_initialize: ensure_session_token

    def self.fine_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.password?(password)
            user
        else
            nil
        end
    end

    def password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end
    
    def reset_session_token!
      self.session_token = SecureRandom::urlsafe_base64
      self.save!
      self.session_token(return token)
    end

    def ensure_session_token
      self.session_token ||= SecureRandom::urlsafe_base64
    end
    
end
