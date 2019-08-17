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


    @seed_track = params[:playlist][:seed_track]
    @containing_album = params[:playlist][:seed_album]

    @track_params = {
      spotify_id: @seed_track[:spotify_id],
      track_number: @seed_track[:track_number],
      name: @seed_track[:name],
      artist: @seed_track[:artist],
      images: @seed_track[:images],
      album_name: @seed_track[:album_name],
      album_id: @seed_track[:album_id],
      duration: @seed_track[:duration],
      explicit: @seed_track[:explicit],
      playlist_id: @playlist[:id]
      }

    if @playlist.save
      render json: @playlist, status: 200

      @track_params[:playlist_id] = @playlist[:id]
      Track.create!(@track_params)

    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1
  def update
    if @playlist.update(playlist_params)
      render json: Playlist.all
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1
  def destroy
    @playlist.destroy
    render json: Playlist.all
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
