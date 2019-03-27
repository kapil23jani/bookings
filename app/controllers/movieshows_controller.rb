class MovieshowsController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movieshow = Movieshow.new
    @theatres = current_user.theatres.all
  end

  def create
    @movieshow = Movieshow.new(movieshow_params)
    @movieshow.theatre_id = @movieshow.screen.theatre.id
    if @movieshow.save
      redirect_to user_movieshows_path(current_user,@movieshow)
    else
      render "new"
    end
  end

  def show
    @movieshow = Movieshow.find(params[:id])
    @screen = Screen.find_by_id(@movieshow.screen_id)
  end

  def show_details
    @movie = Movie.find_by_id(params[:format])
    @shows = @movie.movieshows.group_by(&:theatre)
  end

  def sort_movie_show
    @shows = Movieshow.where(:movie_id => params[:movie_id], :show_date => params[:sort_movie_show]).all
    
  end

  def screen_select
    @screens = Screen.find(params[:theatre_id])       
  end


  private
  
  def movieshow_params
    params.require(:movieshow).permit(:show_date, :show_time, :movie_id,:theatre_id, :screen_id)
  end
end
