class AddTrackNumberToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :track_number, :string
  end
end
