class SessionsController < ApplicationController
    skip_before_action :authorize

    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            if user.email_confirmed
                if params[:remember_me]
                    cookies.permanent[:auth_token] = user.auth_token
                else
                    cookies[:auth_token] = user.auth_token
                end
                redirect_to root_url
                flash[:success] = 'Logado com sucesso!'
            else
                flash.now[:error] = 'Por favor ative sua conta seguindo as
                instruções enviadas no seu email para continuar'
                render 'new'
            end
        else
            redirect_to login_url
            flash[:error] ="Usuário inexistente ou senha incorreta"
        end
    end

    def destroy
        cookies.delete(:auth_token)
        redirect_to root_url
        flash[:success] = "Saida efetuada com sucesso"
    end
end
