class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
    @sweepstake = Sweepstake.find(params[:sweepstake_id])
  end

  def create
    @sweepstake = Sweepstake.find(params[:sweepstake_id])
    @participant = Participant.new(participant_params)
    @participant.price = 5000
    @participant.user = current_user
    @participant.sweepstake = @sweepstake
    if @participant.save!
      redirect_to sweepstake_path(@sweepstake)
    else
      render :new
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:competitor_id, :paid)
  end
end
