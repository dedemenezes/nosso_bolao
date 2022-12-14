class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
    @sweepstake = Sweepstake.find(params[:sweepstake_id])
  end

  def create
    @sweepstake = Sweepstake.first
    @participant = Participant.new(participant_params)
    @participant.price = 5000
    @participant.paid = true
    @participant.user = current_user
    @participant.sweepstake = @sweepstake
    authorize @participant
    if @participant.save!
      redirect_to tournament_path(@sweepstake.tournament)
    else
      render 'sweepstakes/show'
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:competitor_id)
  end
end
