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
                flash[:success] = 'Logged in!'
            else
                flash.now[:error] = 'Please activate your account by following the
                instructions in the account confirmation email you received to proceed'
                render 'new'
            end
        else
            redirect_to login_url
            flash[:error] ="Invalid info"
        end
    end

    def destroy
        cookies.delete(:auth_token)
        redirect_to root_url
        flash[:success] = "Succefully loggedd out"
    end
end
