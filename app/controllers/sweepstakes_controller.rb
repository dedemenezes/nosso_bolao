class SweepstakesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @sweepstakes = Sweepstake.all
  end

  def show
    @sweepstake = Sweepstake.find(params[:id])
  end
end
