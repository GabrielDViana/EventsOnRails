# Model do usuario, chama as validações
class User < ActiveRecord::Base
    attr_accessible :nickname, :complete_name, :email, :password
    has_secure_password
    before_create :confirmation_token
    before_create { generate_token(:auth_token) }

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
                                :message => " of service not accepted"


# Ativação do email
    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end
# Lembrar-me(para manter o usuario conectado)
    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end
# Reseta a senha do usuario e manda e-mail com instruções para redefinição da mesma
    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!(:validate => false)
        UserMailer.password_reset(self).deliver_now
    end
# Chave que será mandada pelo email
    private
        def confirmation_token
            if self.confirm_token.blank?
                self.confirm_token = SecureRandom.urlsafe_base64.to_s
            end
        end
end
