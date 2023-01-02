class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    binding.pry
    @photo = Photo.new(photos_params)
    @album = Album.find(photos_params[:album_id])
    if @photo.save
      redirect_to album_photo_path(@album, @photo)
    end
  end

  def new
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new
  end

  def index
    @photos = Photo.where(albums_id: photos_params[:albums_id])
  end

  def delete
  end

  def update
  end

  private

  def photos_params
    params.require(:photo).permit(:album_id, :title, :image)
  end
end
