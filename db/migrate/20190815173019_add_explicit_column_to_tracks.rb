class AddExplicitColumnToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :explicit, :string
  end
end
