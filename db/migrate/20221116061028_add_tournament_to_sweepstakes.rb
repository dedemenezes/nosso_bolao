class AddTournamentToSweepstakes < ActiveRecord::Migration[7.0]
  def change
    add_reference :sweepstakes, :tournament, null: true, foreign_key: true
  end
end
