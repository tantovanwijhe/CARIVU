class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.car = Car.find(params[:car_id])
    @booking.user = current_user
    if @booking.save
      redirect_to user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @lastbook = Booking.last
  end
  
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
