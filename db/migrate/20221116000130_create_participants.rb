class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sweepstake, null: false, foreign_key: true
      t.boolean :paid
      t.integer :price
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
