class WelcomeController < ApplicationController
  def index
    @profile = current_user.profile_manager if signed_in?
    @bookings = current_user.bookings if signed_in?
    @movies = Movie.all
    
  end
end
