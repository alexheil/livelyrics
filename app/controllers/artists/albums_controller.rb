class Artists::AlbumsController < ApplicationController

  before_action :authenticate_user!, except: :show
  before_action :authenticate_alex!, only: [:edit, :update,:destroy]

  def show
    @album = Album.friendly.find(params[:id])
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def new
    @artist = Artist.friendly.find(params[:artist_id])
    @album = Album.new
  end

  def create
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.build(album_params)
    if @album.save
      flash[:notice] = "You just created " + @album.name + "!"
      redirect_to artist_path(@artist)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @album = Album.friendly.find(params[:id])
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def update
    @album = Album.friendly.find(params[:id])
    @artist = Artist.friendly.find(params[:artist_id])
    if @album.update_attributes(album_params)
      flash[:notice] = "Good job!"
      redirect_to artist_album_path(@artist, @album)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @album = Album.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def album_params
      params.require(:album).permit(:name, :year)
    end

    def authenticate_alex!
      @album = Album.friendly.find(params[:id])
      @artist = Artist.friendly.find(params[:artist_id])
      @user = current_user
      redirect_to artist_album_path(@artist, @album) if @user.username != "alexheil"
    end

end
