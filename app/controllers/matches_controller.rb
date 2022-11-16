class MatchesController < ApplicationController
  def index
    @matches = policy_scope(Match).sort_by(&:local_date)
    @tournament = @matches.first.tournament
  end
end
