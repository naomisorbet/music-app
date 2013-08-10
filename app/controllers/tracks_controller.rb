class TracksController < ApplicationController
  before_filter :require_login
  def show
    @track = Track.includes(:album, :band).find_by_id(params[:id])
    render :show
  end

  def new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(params[:track])
    @track.album_id = params[:album_id]
    if @track.save
      redirect_to track_url(@track)
    else
      flash[:notices] ||= []
      @track.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to new_track_url
    end
  end

  def edit
    @albums = Album.all
    @track = Track.find_by_id(params[:id])
    render :edit
  end

  def update
    @track = Track.find_by_id(params[:id])
    @track.update_attributes(params[:track])
    if @track.update
      redirect_to track_url(@track)
    else
      flash[:notices] ||= []
      @track.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to edit_track_url
    end
  end

  def destroy
    @track = Track.find_by_id(params[:id])
    album_id = @track.album_id
    if @track.destroy
      redirect_to album_url(album_id)
    else
      flash[:notices] ||= []
      @track.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to edit_track_url
    end
  end

end
