class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by_id(params[:id])
    @albums = @band.albums.order("date DESC")
    render :show
  end

  def new
    render :new
  end

  def create
    @band = Band.new(params[:band])
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:notices] ||= []
      @band.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end

  def update
    @band = Band.find_by_id(params[:id])
    @band.update_attributes(params[:band])
    if @band.update
      redirect_to band_url(@band)
    else
      flash[:notices] ||= []
      @band.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to edit_band_url
    end
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    if @band.destroy
      redirect_to bands_url
    else
      flash[:notices] ||= []
      @band.errors.each do |error, message|
        flash[:notices] << message
      end
      redirect_to edit_band_url
    end
  end
end
