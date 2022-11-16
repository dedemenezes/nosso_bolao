class AddGroupToCompetitor < ActiveRecord::Migration[7.0]
  def change
    add_column :competitors, :group, :string
  end
end
