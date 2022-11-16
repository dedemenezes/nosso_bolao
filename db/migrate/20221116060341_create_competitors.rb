class CreateCompetitors < ActiveRecord::Migration[7.0]
  def change
    create_table :competitors do |t|
      t.references :tournament, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
