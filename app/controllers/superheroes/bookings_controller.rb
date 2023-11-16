class Superheroes::BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings_as_superhero
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted!
    redirect_to superheroes_booking_path, status: :see_other
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.declined!
    redirect_to superheroes_booking_path, status: :see_other
  end
end
