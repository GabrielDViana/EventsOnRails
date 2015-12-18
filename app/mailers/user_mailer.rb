class UserMailer < ActionMailer::Base

# Este metodo enviará o email de confirmaçao para o usuario
    def registration_confirmation(user)
        @user = user
        mail(:to => user.email,
            :from => 'gabrielv14@gmail.com',
            :subject => "Registration Confirmation")do|format|
                format.html { render layout: 'registration_confirmation' }
            end
    end
end
