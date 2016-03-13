class NewCapController < ApplicationController
  def index
    @user = User.new
    @news = Cap.limit(4).order('start_at desc')
  end
end
