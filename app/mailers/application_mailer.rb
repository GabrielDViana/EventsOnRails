class ApplicationMailer < ActionMailer::Base
    default :from => "gabrielv14@gmail.com"
    layout 'registration_confirmation'
end
