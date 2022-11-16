class MatchBetsController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @match_bet = MatchBet.new(match_bet_params)
    @match_bet.participant = current_user.participants.first
    @match_bet.match = @match
    authorize @match_bet
    if @match_bet.save
      redirect_to tournament_matches_path(@match.tournament)
    else
      render 'tournaments/show', tournament: @match.tournament
    end
  end

  private

  def match_bet_params
    params.require(:match_bet).permit(:home_score, :away_score)
  end
end
