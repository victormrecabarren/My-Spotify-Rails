class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.string :playlist_name
      t.string :playlist_img

      t.timestamps
    end
  end
end
