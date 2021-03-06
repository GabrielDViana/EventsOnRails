class User < ActiveRecord::Base
    attr_accessible :nickname, :complete_name, :email, :password, :terms,
        :profile_image, :birthday, :experience, :address, :latitude, :longitude,
        :city, :state, :country, :curriculum
    has_secure_password
    has_secure_token
    before_create :confirmation_token
    before_create { generate_token(:auth_token) }
    has_many :participations
    has_many :caps, dependent: :destroy
    has_many :caps, through: :participations
    geocoded_by :address

    after_validation    :geocode,
                        :on => :update,
                        :if => :address_changed?

    validates   :nickname,
                presence: true,
                uniqueness: true,
                length:{
                    minimum: 3,
                    maximum: 45
                }

    validates   :complete_name,
                format: {
                  with: /[a-zA-Z]+/
                },
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
                :on => :create,
                length:{
                    minimum: 6,
                    maximum: 20
                },
                presence: true

    validates   :terms,
                :acceptance => true

    has_attached_file   :profile_image
    validates_attachment    :profile_image,
        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


    has_attached_file   :curriculum
    validates_attachment    :curriculum,
        content_type: { :content_type => %w(application/pdf
          application/msword application/vnd.openxmlformats-officedocument
            .wordprocessingml.document) }

    validates_date  :birthday,
                    on_or_after: lambda { 125.years.ago },
                    on_or_before: lambda { 18.years.ago }

    validates   :experience,
                :on => :update,
                length:{ maximum: 300 }
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

    def to_param
      token
    end
# Chave que será mandada pelo email
    private
        def confirmation_token
            if self.confirm_token.blank?
                self.confirm_token = SecureRandom.urlsafe_base64.to_s
            end
        end
end
