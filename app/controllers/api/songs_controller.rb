class Api::SongsController < ApplicationController

    def index
      @songs = Artist.find(params[:artist_id]).songs
      render json: @songs
    end
  
    def show
        @songs = Song.find(params[:id])
        render json: @songs
    end
  
    def create
      @songs = Song.create!(song_params)
      render json: @songs
    end
  
    def update
      @songs = Song.find(params[:id])
      @songs + update!(song_params)
  
      render json: @songs
    end
  
    def destroy
      @songs = Song.find(params[:id])
      @songs.destroy
  
      render status: :ok
  
    end
  
    private
    def song_params
      params
      .require(:song)
      .permit(
        :title, 
        :preview_url,
        :album,
        :artist_id
        )
    end
  
end
