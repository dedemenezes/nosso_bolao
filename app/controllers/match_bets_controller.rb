class MatchBetsController < ApplicationController

  def edit
    @match = Match.find(params[:match_id])
    @match_bet = MatchBet.find(params[:id])
    authorize @match_bet
    respond_to do |format|
      format.html

      format.text { render(partial: 'match_bets/form', locals: { match: @match, match_bet: @match_bet }, formats: [:html]) }
    end
  end

  def create
    @match = Match.find(params[:match_id])
    @match_bet = MatchBet.new(match_bet_params)
    @match_bet.participant = current_user.participant
    @match_bet.match = @match
    authorize @match_bet
    if @match_bet.save
      redirect_to tournament_matches_path(@match.tournament)
    else
      render 'tournaments/show', tournament: @match.tournament
    end
  end

  def update
    @match_bet = MatchBet.find(params[:id])
    authorize @match_bet
    if @match_bet.update(match_bet_params)
      redirect_to tournament_matches_path(@match_bet.match.tournament)
    else
      render 'tournaments/show', tournament: @match.tournament
    end
  end

  private

  def match_bet_params
    params.require(:match_bet).permit(:home_score, :away_score)
  end
end
