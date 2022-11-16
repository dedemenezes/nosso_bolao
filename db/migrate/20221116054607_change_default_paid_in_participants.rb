class ChangeDefaultPaidInParticipants < ActiveRecord::Migration[7.0]
  def change
    change_column_default :participants, :paid, from: nil, to: false
  end
end
