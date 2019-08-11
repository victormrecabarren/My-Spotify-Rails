class SearchController < ApplicationController
  def index
    spotify_albums = RSpotify::Album.search("My Beautiful Dark Twisted Fantasy")

    myarray = []

    spotify_albums.map{ |album| myarray.push({
        album_id: album.id,
        name: album.name,
        artist: album.artists[0].name,
        artist_id: album.artists[0].id,
        img: album.images,
        tracks: []
        })
     }
     myarray.map{ |album|
       RSpotify:: Album.find(album[:album_id]).tracks.map{ |track|
         album[:tracks].push({
            track_number: track.track_number,
            title: track.name,
            explicit: track.explicit,
            milliseconds: track.duration_ms
           })
         }
       }

    render json: { results: myarray}
  end
end
