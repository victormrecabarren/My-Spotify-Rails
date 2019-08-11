class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.integer :spotify_id
      t.integer :playlist_id
      t.string :name
      t.string :artist
      t.string :image
      t.string :album_name
      t.string :preview

      t.timestamps
    end
  end
end
