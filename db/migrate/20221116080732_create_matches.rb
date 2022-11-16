class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :group
      t.boolean :finished
      t.integer :away_score
      t.integer :home_score
      t.datetime :local_date
      t.integer :matchday
      t.string :type
      t.references :tournament, null: false, foreign_key: true
      t.references :away_competitor, foreign_key: { to_table: :competitors }
      t.references :home_competitor, foreign_key: { to_table: :competitors }

      t.timestamps
    end
  end
end
