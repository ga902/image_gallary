class UsersController < ApplicationController

  def show
    @user = User.find(params[:format])
    @albums = @user.albums.paginate(page: params[:page])
  
  end

  def index
    @users = User.all
  end

  def delete
  end

  def update
  end
end
