class ParticipationsController < ApplicationController

  def new
    @participation = Participation.new
    @participation.user = current_user
    @participation.cap = Cap.find(params[:cap_id])
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    current_user.update_attributes(participation_params[:user_attributes])
    @participation.cap = Cap.find(params[:cap_id])
    if @participation.save
      redirect_to caps_path, notice: "Voce foi registrado no Cap!"
    else
      render action: 'new'
    end
  end

private

  def participation_params
    params.require(:participation).permit(:id, user_attributes: [:id, :complete_name])
  end
end
