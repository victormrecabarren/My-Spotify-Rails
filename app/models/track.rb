class Track < ApplicationRecord
  belongs_to :playlist


  @sample = "RSpotify::Track.find('2UzMpPKPhbcC8RbsmuURAZ')"

  def new_track(song)
    @track = Track.create(
      spotify_id: song.id,
      name: song.name,
      artist: song.artists[0].name,
      image: song.album.images[0]["url"],
      album_name: song.album.name,
      preview:song.preview_url,
      album_id: song.album.id
      )
  end

end
