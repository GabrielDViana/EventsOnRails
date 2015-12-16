# Model do usuario, chama as validações
class User < ActiveRecord::Base
    has_secure_password
    before_create :confirmation_token

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
                    minimum: 6,
                    maximum: 20
                },
                presence: true

    validates_acceptance_of     :terms,
                                :allow_nil => false,
                                :message => " of service not accepted"


# Ativação do email
    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    private
        def confirmation_token
            if self.confirm_token.blank?
                self.confirm_token = SecureRandom.urlsafe_base64.to_s
            end
        end
end
