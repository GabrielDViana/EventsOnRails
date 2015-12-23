class UserMailer < ActionMailer::Base

# Este metodo enviará o email de confirmaçao para o usuario
    def registration_confirmation(user)
        @user = user
        mail(:to => user.email,
            :from => 'New Cap',
            :subject => "Registration Confirmation")do|format|
                format.html { render layout: 'registration_confirmation' }
            end
    end
# Este método enviará o email para redefinição de senha
    def password_reset(user)
        @user = user
        mail(:to => user.email,
            :from => 'New Cap',
            :subject => 'Password reset')do|format|
                format.html { render layout: 'password_reset' }
            end
    end
end
