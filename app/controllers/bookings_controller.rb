class BookingsController < ApplicationController
	def index
		@movieshow = Movieshow.find(params[:movieshow_id])
		@booking = @movieshow.bookings 
	end

	def new
		
		@movieshow = Movieshow.find(params[:movieshow_id])
		@booking = @movieshow.bookings.new	
	end

	def create
		@user = current_user
		@movieshow = Movieshow.find(params[:movieshow_id])
		@booking = @user.bookings.create(booking_params)
		if @booking.save
			redirect_to user_movieshows_path
		end
	end


	private
	def booking_params
		params.require(:booking).permit(:movieshow_id,:seats, :price)
	end
end
