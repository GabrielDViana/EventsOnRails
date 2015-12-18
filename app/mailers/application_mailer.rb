class ApplicationMailer < ActionMailer::Base
    # O Layout carrega a view que sera usada como template para o corpo do email
    layout 'registration_confirmation'
end
