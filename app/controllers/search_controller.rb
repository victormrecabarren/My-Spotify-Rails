class SearchController < ApplicationController
  before_action :set_search, only: [:show]
  def index
  end

  def show
    render json: {
      albums: @albums,
      artists: @artists,
      tracks: @tracks,
      }, status: 200
  end

  private

  def set_search

    spotify_results = RSpotify::Base.search(params[:id], 'artist, album, track')

    @artists = spotify_results.select{|result|result.type==="artist"}.map{|artist| artist = {
      artist_id: artist.id,
      name: artist.name,
      img: artist.images,
      tracks: [],
      type: artist.type
      }
    }
    @albums = spotify_results.select{|result|result.type==="album"}.map{|album| album = {
      album_id: album.id,
      name: album.name,
      artist: album.artists[0].name,
      artist_id: album.artists[0].id,
      img: album.images,
      tracks: [],
      type: album.type
      }
    }
    @tracks = spotify_results.select{|result|result.type==="track"}.map{|track| track = {
      track_id: track.id,
      track_number: track.track_number,
      name: track.name,
      explicit: track.explicit,
      artist: track.artists[0].name,
      artist_id: track.artists[0].id,
      album: track.album.name,
      album_id: track.album.id,
      img: track.album.images,
      type: track.type
      }
    }


    #
    # spotify_results.map{ |result| @my_search.push({
    #     album_id: result.id,
    #     name: result.name,
    #     artist: result.artists[0].name,
    #     artist_id: result.artists[0].id,
    #     img: result.images,
    #     tracks: [],
    #     type: result.type
    #     })
    #  }
    #  @my_search.map{ |album|
    #    RSpotify:: Album.find(album[:album_id]).tracks.map{ |track|
    #      album[:tracks].push({
    #         track_number: track.track_number,
    #         title: track.name,
    #         explicit: track.explicit,
    #         milliseconds: track.duration_ms
    #        })
    #      }
    #    }
  end

end
