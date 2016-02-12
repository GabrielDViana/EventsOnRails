class NewCapController < ApplicationController
  def index
    @user = User.new
  end
end
