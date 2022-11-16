class MatchesController < ApplicationController
  def index
    @matches = policy_scope(Match).includes(:home_competitor, :away_competitor).sort_by(&:local_date)
    @tournament = @matches.first.tournament
    @match_bet = MatchBet.new
  end
end
