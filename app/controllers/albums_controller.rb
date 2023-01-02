class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
  end

  def index
    @albums =Album.where(user_id: current_user)
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      redirect_to album_path(@album)
    end
  end

  def delete

  end

  private

  def album_params
    params.require(:album).permit(:id, :name, :user_id)
  end
end
