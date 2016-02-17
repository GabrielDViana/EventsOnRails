class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorize, only: [:new, :create, :index]

    def index
        @users = User.all
    end

    def show
      @cap = Cap.new
      @caps = @user.caps
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
            flash[:success] = "Please confirm your email address to continue"
            redirect_to root_url
        else
            flash[:error] = "Try again. Something went wrong!"
            render 'new'
        end
    end
# Metodo update permitira que o usuário faça a edição dos dados que achar necessario
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user, notice: 'User was successfully updated.'
        else
            render :edit
        end
    end
# Metodo destroy exclui o usuário
    def destroy
        @user.destroy
        redirect_to users_url, notice: 'User was successfully destroyed.'
    end
# Método que irá verificar se o usuário confirmou o email de registro
    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            flash[:success] = "Welcome to New Cap! Your email has been confirmed.
            Please, sign in to continue."
            redirect_to login_url
        else
            flash[:error] = "Sorry. User does not exist"
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
                :city, :state, :country)
        end
end
