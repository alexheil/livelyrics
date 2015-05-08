class Artists::ArtistsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_alex!, only: [:edit, :update,:destroy]

  def index
    @artists = Artist.all
    if params[:search]
      @artists = Artist.search(params[:search]).order("created_at DESC")
    else
      @artists = Artist.all.order('created_at DESC')
    end
  end

  def show
    @artist = Artist.friendly.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "You just created " + @artist.artist_name + "!"
      redirect_to artist_path(@artist)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @artist = Artist.friendly.find(params[:id])
  end

  def update
    @artist = Artist.friendly.find(params[:id])
    if @artist.update_attributes(artist_params)
      flash[:notice] = "Good job!"
      redirect_to artist_path(@artist)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def artist_params
      params.require(:artist).permit(:artist_name, :artist_facebook)
    end

    def authenticate_alex!
      @artist = Artist.friendly.find(params[:id])
      @user = current_user
      redirect_to artist_path(@artist) if @user.username != "alexheil"
    end

end
