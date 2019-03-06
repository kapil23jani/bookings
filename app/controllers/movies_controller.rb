class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def showmovies
		@movies = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		if @movie.update(movie_params)
			redirect_to showmovies_path(@movie)
		else
			render "edit"
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		if @movie.destroy
			redirect_to showmovies_path
		end
	end


	def create
		@movie = Movie.create(movie_params)
		if @movie.save 
			redirect_to showmovies(@movie)
		end
	end

	def show
		@movie = Movie.find(params[:id])
	end


	private
	def movie_params
		params.require(:movie).permit(:name, :type, :summary, :thumbnail, :trailer, cover_pics: [])
	end

end