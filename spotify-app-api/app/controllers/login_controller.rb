class LoginController < ApplicationController

  def index

  end

  def show
    puts params[:id]
    spotify = Spotify.new
     @album = spotify.search_album(params[:id])
    render json: @album
  end

end
