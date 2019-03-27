class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
    end

    def new
        @bookings = Booking.all
        @movieshow = Movieshow.find(params[:movieshow_id])
        @booking = @movieshow.bookings.new  
    end

    def create
        @booking = current_user.bookings.create(booking_params)
        if @booking.save
            redirect_to user_movieshows_path
        else
            render "new"
        end
    end

    def edit  
      @bookings = Booking.all
      @booking = Booking.find_by_id(params[:id])
      @movieshow = Movieshow.find_by_id(@booking.movieshow.id)
    end

    def update
      @bookings = Booking.all
      @booking = Booking.find_by_id(params[:id])
      @movieshow = Movieshow.find_by_id(@booking.movieshow.id)
      if @booking.update(booking_params)
        redirect_to user_bookings_path(current_user)
      else
        render "edit"
      end
    end

    def search_booking
    end


    private
    
    def booking_params
        params.require(:booking).permit(:movieshow_id, :seats, :price)
    end
end
