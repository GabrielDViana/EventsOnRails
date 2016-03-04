class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorize, only: [:new, :create, :index]

    def index
        @users = User.all
    end

    def show
      @cap = Cap.new
      @joined = @user.caps
      @caps = Cap.where(:user_id => params[:id])
    end

    def new
        @user = User.new
    end
# Metodo create irá pedir que o usuário confirme o email
    def create
        @user = User.new(user_params)
        # Caso o usuario seja salvo com os dados validos, um email sera enviado
        if @user.save
            UserMailer.registration_confirmation(@user).deliver_now
            flash[:error] = "Por favor confirme seu cadastro no email que enviamos"
            redirect_to root_url
        else
            flash[:error] = "Tente novamente! Ocorreu alguma falha no cadastro."
            render 'new'
        end
    end
# Metodo update permitira que o usuário faça a edição dos dados que achar necessario
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user
            flash[:success] = 'Perfil atualizado'
        else
            render :edit
        end
    end
# Metodo destroy exclui o usuário
    def destroy
        @user.destroy
        redirect_to users_url
        flash[:success] = 'Conta removida com sucesso.'
    end
# Método que irá verificar se o usuário confirmou o email de registro
    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            flash[:success] = "Bem vindo a newcap! Sua conta foi confirmada com
            sucesso!"
            redirect_to login_url
        else
            flash[:error] = "Desculpe, o usuário não existe"
            redirect_to root_url
        end
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:nickname, :complete_name, :email,
                :password, :password_confirmation, :terms, :profile_image,
                :birthday, :experience, :address, :latitude, :longitude,
                :city, :state, :country, :curriculum)
        end
end
