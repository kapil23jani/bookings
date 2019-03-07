class MovieshowsController < ApplicationController

	def index
		@movies = Movie.all
		@theatre = Theatre.all
		@movieshows = Movieshow.all
	end

	def new
		@movieshow = Movieshow.new
	end

	def create
		@movieshow = Movieshow.create(movieshow_params)
		if @movieshow.save
			redirect_to movieshows_path(@movieshow)
		end
	end

	def show
		@movieshow = Movieshow.find(params[:id])
		@screen = Screen.find_by_id(@movieshow.screen_id)
	end

	def show_details
		@movie = Movie.find_by_id(params[:format])
		@shows = @movie.movieshows	
	end


	private
	def movieshow_params
		params.require(:movieshow).permit(:show_date, :show_time, :movie_id,:theatre_id, :screen_id)
	end
end
