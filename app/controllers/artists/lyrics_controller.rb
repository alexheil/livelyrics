class Artists::LyricsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_alex!, only: [:edit, :update,:destroy]

  def index
  end

  def show
    @lyric = Lyric.friendly.find(params[:id])
    @album = Album.friendly.find(params[:album_id])
    @artist = Artist.friendly.find(params[:artist_id])
    begin
      @user = User.find(@lyric.user_id)
    rescue ActiveRecord::RecordNotFound
      @user = User.find_by_id(1)
    end
  end

  def new
    @album = Album.friendly.find(params[:album_id])
    @artist = Artist.friendly.find(params[:artist_id])
    @lyric = Lyric.new
  end

  def create
    @artist = Artist.friendly.find(params[:artist_id])
    @album = Album.friendly.find(params[:album_id])
    @lyric = @album.lyrics.build(lyric_params)
    @lyric.artist_id = @album.artist_id
    @lyric.user_id = current_user.id
    if @lyric.save
      flash[:notice] = "You just created " + @lyric.track_name + "!"
      redirect_to artist_album_path(@lyric.artist_id, @album)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @lyric = Lyric.friendly.find(params[:id])
    @album = Album.friendly.find(params[:album_id])
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def update
    @lyric = Lyric.friendly.find(params[:id])
    @album = Album.friendly.find(params[:album_id])
    @artist = Artist.friendly.find(params[:artist_id])
    if @lyric.update_attributes(lyric_params)
      flash[:notice] = "Good job!"
      redirect_to artist_album_lyric_path(@artist, @album, @lyric)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @lyric = Lyric.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def lyric_params
      params.require(:lyric).permit(:track_name, :track_number, :lyrics, :user_publisher_id)
    end

    def authenticate_alex!
      @lyric = Lyric.friendly.find(params[:id])
      @album = Album.friendly.find(params[:album_id])
      @artist = Artist.friendly.find(params[:artist_id])
      @user = current_user
      redirect_to artist_album_lyric_path(@artist, @album, @lyric) if @user.username != "alexheil"
    end

end
