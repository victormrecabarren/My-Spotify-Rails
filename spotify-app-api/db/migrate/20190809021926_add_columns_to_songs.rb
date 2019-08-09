class AddColumnsToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :img, :string
    add_column :songs, :album, :string
  end
end
