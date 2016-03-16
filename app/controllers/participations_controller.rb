class ParticipationsController < ApplicationController

  def new
    @participation = Participation.new
    @participation.user = current_user
    @participation.cap = Cap.find_by_token(params[:token])
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    current_user.update_attributes(participation_params[:user_attributes])
    @cap = Cap.find_by_token(params[:token])
    @participation.cap = @cap
    if @participation.save
      redirect_to caps_path
      flash[:success] = "Voce foi registrado no Cap!"
    else
      render action: 'new'
    end
  end

private

  def participation_params
    params.require(:participation).permit(:id, user_attributes: [:id, :complete_name])
  end
end
