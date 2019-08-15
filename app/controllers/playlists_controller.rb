class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :destroy]

  # GET /playlists
  def index
    @playlists = Playlist.all

    render json: @playlists
  end

  # GET /playlists/1
  def show
    render json: @playlist.to_json(include: :tracks)
  end

  # POST /playlists
  def create


    @playlist = Playlist.new(playlist_params)


    seed_track = params[:playlist][:seed_track]
    containing_album = params[:playlist][:seed_album]

    Track.new({
      spotify_id: seed_track.id,
      playlist_id: @playlist.id,
      name: seed_track.name,
      artist: containing_album.artist,
      image: containing_album.images[0].url,
      album_name: containing_album.name,
      album_id: containing_album.id,
      })

    if @playlist.save
      render json: @playlist, status: 200
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1
  def update
    if @playlist.update(playlist_params)
      render json: @playlist
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1
  def destroy
    @playlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def playlist_params

      params.require(:playlist).permit(:id, :user_id, :playlist_name, :playlist_img, :seed_track, :seed_album)
    end
end
