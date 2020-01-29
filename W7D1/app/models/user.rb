class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true, allow_nil: true, length: {
        minimum: 6
    }
    before_validation :ensure_session_token
    attr_reader :password


    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save! # save runs validation and if it's a new record, it'll be created (otherwise update)
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def password=(password)
        @password = password # create the instance variable
        self.password_digest = BCrypt::Password.create(password)
    end

end
