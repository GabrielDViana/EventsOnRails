class User < ActiveRecord::Base
    has_secure_password

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
                
end
