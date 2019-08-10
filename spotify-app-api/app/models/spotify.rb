class Spotify
  def search_album (query)
    RSpotify::Artist.search(query)
  end
end
