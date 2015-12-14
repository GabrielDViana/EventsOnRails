class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_url, notice: 'Logged in!'
      else
          redirect_to login_url, notice:"Invalid info"
      end
  end

  def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Succefully loggedd out"
  end
end
