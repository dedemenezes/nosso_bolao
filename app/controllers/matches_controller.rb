class MatchesController < ApplicationController
  def index
    @sweepstake = Sweepstake.find(params[:sweepstake])
    @matches = policy_scope(Match).where(tournament: @sweepstake.tournament)
  end
end
