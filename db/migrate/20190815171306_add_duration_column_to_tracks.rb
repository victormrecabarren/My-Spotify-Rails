class AddDurationColumnToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :duration, :string
  end
end
