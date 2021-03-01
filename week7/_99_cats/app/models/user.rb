class User < ApplicationRecord
    validates :username, presence: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true

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

    
end
