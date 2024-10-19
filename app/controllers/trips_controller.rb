class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @trip = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trips_show_path(@trip)
    else
      render trips_new_path
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      if params[:trip][:images]
        @trip.images.attach(params[:trip][:images])
        flash[:notice] = "Images attached successfully."
      end
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_index_path
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description)
  end
end
