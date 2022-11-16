class TournamentsController < ApplicationController

  def show
    @tournament = Tournament.find(params[:id])
    @competitors = @tournament.competitors.group_by(&:group).sort_by(&:first)
    @participant = current_user.participant || Participant.new
    authorize @tournament
  end
end
