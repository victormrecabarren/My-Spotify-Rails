class AddColumnToTracksTable < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :album_id, :string
  end
end
