class CreateMatchBets < ActiveRecord::Migration[7.0]
  def change
    create_table :match_bets do |t|
      t.references :match, null: false, foreign_key: true
      t.references :participant, null: false, foreign_key: true
      t.integer :home_score
      t.integer :away_score
      t.integer :final_result, default: 0

      t.timestamps
    end
  end
end
