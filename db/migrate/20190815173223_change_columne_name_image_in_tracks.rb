class ChangeColumneNameImageInTracks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tracks, :image, :images
  end
end
