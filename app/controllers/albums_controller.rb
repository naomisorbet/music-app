class AlbumsController < ApplicationController
  before_filter :require_login

  def index
    @albums = Album.includes(:band).all
    render :index
  end

  def show
    @album = Album.includes(:band).find_by_id(params[:id])
    @tracks = @album.tracks.order("ORD ASC")
    render :show
  end

  def new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:notices] ||= []
      @album.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to new_album_url
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find_by_id(params[:id])
    render :edit
  end

  def update
    @album = Album.find_by_id(params[:id])
    @album.update_attributes(params[:album])
    if @album.update
      redirect_to album_url(@album)
    else
      flash[:notices] ||= []
      @album.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = Album.find_by_id(params[:id])
    if @album.destroy
      redirect_to albums_url
    else
      flash[:notices] ||= []
      @album.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to edit_album_url
    end
  end


end
