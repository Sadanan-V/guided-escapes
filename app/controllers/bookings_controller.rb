class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @received_bookings = current_user.bookings_as_guide
  end

  def create
    # booking needs experience, user, status, start date
    raise
    @booking = Booking.new(booking_params)
    @experience = Experience.find(params[:experience_id])
    @booking.status = "pending"
    @booking.user = current_user
    @booking.experience = @experience

    if @booking.save
      redirect_to experience_path(@experience)
    else
      render "#", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:experience, :user, :status, :date)
  end
end
