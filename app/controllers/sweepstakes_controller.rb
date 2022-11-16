class SweepstakesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @sweepstakes = Sweepstake.all
  end

  def show
    @sweepstake = Sweepstake.joins(:competitors).find(params[:id])
    @participant = Participant.new
    @competitors = @sweepstake.competitors.group_by(&:group).sort_by(&:first)
    authorize @sweepstake
  end
end
