class BookingsController < ApplicationController
	def index
		@movieshow = Movieshow.find(params[:movieshow_id])
	end
end
