class AlbumsController < ApplicationController
  before_action :set_album

  def show
    render json: @show_album
  end

  private

  def set_album
    album = RSpotify::Album.find(params[:id])

    tracks = []

    album.tracks_cache.map{|track|
      tracks.push({
        id: track.id,
        track_number: track.track_number,
        name: track.name,
        duration: Time.at(track.duration_ms/1000).strftime("%M:%S"),
        explicit: track.explicit,
      })
    }

    @show_album = {
      id: album.id,
      name: album.name,
      artist: album.artists[0].name,
      images: album.images,
      release: album.release_date[0,4],
      total_tracks: album.total_tracks,
      tracks: tracks,
      type: "album"
    }

  end

end
