class AddDetailsToCompetitor < ActiveRecord::Migration[7.0]
  def change
    add_column :competitors, :name, :string
    add_column :competitors, :img_url, :string
  end
end
