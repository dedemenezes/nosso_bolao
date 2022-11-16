class AddCompetitorReferencesInParticipants < ActiveRecord::Migration[7.0]
  def change
    add_reference :participants, :competitor, foreign_key: true
  end
end
