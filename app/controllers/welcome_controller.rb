class WelcomeController < ApplicationController
  def index
  	@user = current_user
  	@profile = @user.profile_manager if signed_in?
  	@bookings = @user.bookings
  end
end
