class AddImgUrlToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :img_url, :string
  end
end