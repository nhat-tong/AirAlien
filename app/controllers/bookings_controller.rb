class BookingsController < ApplicationController
    before_action :authenticate_user!

    def create
        @booking = current_user.bookings.create(booking_params)
        if @booking.persisted?
            redirect_to @booking.room, notice: "Your booking has been created..."
        else
            redirect_to @booking.room, alert: "Opps! Something went wrong! Please check your start date and end date"
        end
    end

    private
        def booking_params
            params.require(:booking).permit(:start_date, :end_date, :price, :total, :room_id)
        end
end