class CreateSweepstakes < ActiveRecord::Migration[7.0]
  def change
    create_table :sweepstakes do |t|
      t.string :name
      t.datetime :starting_at
      t.datetime :ending_at
      t.integer :prize
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
