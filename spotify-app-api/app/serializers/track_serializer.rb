class TrackSerializer < ActiveModel::Serializer
  attributes :id, :spotify_id, :playlist_id, :name, :artist, :image, :album_name, :preview
end
