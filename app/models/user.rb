# Model do usuario, chama as validações
class User < ActiveRecord::Base
    has_secure_password
    before_save :encrypt_password
    after_save :clear_password

    validates   :nickname,
                presence: true,
                uniqueness: true,
                length:{
                    minimum: 3,
                    maximum: 45
                }

    validates   :complete_name,
                presence: true,
                length:{
                    minimum: 3,
                    maximum: 45
                }

    validates   :email,
                presence: true,
                uniqueness: true,
                format: {
                    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
                }
    validates   :password,
                length:{
                    minimum: 8
                },
                presence: true

    validates_acceptance_of     :terms,
                                :allow_nil => false,
                                :message => " of service not accepted"

    attr_accessor :salt

    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.password= BCrypt::Engine.hash_secret(password, salt)
        end
    end
    def clear_password
        self.password = nil
    end
end
