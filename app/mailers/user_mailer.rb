class UserMailer < ActionMailer::Base
    
    def registration_confirmation(user)
        @user = user

        mail(:to => "#{user.complete_name} <#{user.email}>",
            :subject => "Registration Confirmation")do|format|
                format.html { render layout: 'registration_confirmation' }
            end
    end
end
