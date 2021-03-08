class User < ApplicationRecord
    validates :username, :password_digest, presence: true
    validates :username, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }
    has_many :subs
    attr_reader :password
    after_initialize :ensure_session_token!
    # spire
    def self.find_by_credentials(username, password)
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
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.base64
        self.save!
        self.session_token
    end

    def ensure_session_token!
        self.session_token ||= SecureRandom.base64
    end
end
