class MoviesController < ApplicationController

  def showmovies
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @casts = current_user.casts
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to user_showmovies_path(current_user,@movie)
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
    @movie = current_user.movies.create(movie_params)
    if @movie.save 
      redirect_to user_showmovies_path(current_user,@movie)
    else
      render "new"
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  


  private
  
  def movie_params
    params.require(:movie).permit(:name, :type, :summary, :thumbnail, :trailer, :release_date, :duration, cover_pics: [], cast_ids: [])
  end

end
