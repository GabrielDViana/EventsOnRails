class UserMailer < ActionMailer::Base

# Este metodo enviará o email de confirmaçao para o usuario
    def registration_confirmation(user)
        @user = user
        mail(:to => user.email,
            :from => 'newcap',
            :subject => "Confirmação de cadastro")
            render layout: 'registration_confirmation'
    end
# Este método enviará o email para redefinição de senha
    def password_reset(user)
        @user = user
        mail(:to => user.email,
            :from => 'newcap',
            :subject => 'Redefinição de senha')
             render layout: 'password_reset'
    end
end
