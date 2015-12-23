class PasswordResetsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:email])
        user.send_password_reset if user
        redirect_to root_url, :notice => "Email sent with instructions"
    end

    def edit
        @user = User.find_by_password_reset_token!(params[:id])
    end

    def update
        @user = User.find_by_password_reset_token!(params[:id])
        if @user.password_reset_sent_at < 3.hours.ago
            redirect_to password_resets_path, :alert => "Password reset has expired"
        elsif @user.update_attributes(params[:user])
            redirect_to root_url, :notice => "Password updated!"
        else
            render :edit
        end
    end
end
