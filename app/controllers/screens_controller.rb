class ScreensController < ApplicationController
	
	def new
		@theatre = Theatre.find(params[:theatre_id])
		@screen = @theatre.screens.new
	end

	def create 
		@theatre = Theatre.find(params[:theatre_id])
		@screen = @theatre.screens.create(screen_params)
		if @screen.save 
			redirect_to user_allshow_path(@screen)
		end
	end

	def edit
		@theatre = Theatre.find(params[:theatre_id])
		@screen = Screen.find(params[:id])
	end

	def update
		@theatre = Theatre.find(params[:theatre_id])
		@screen = Screen.find(params[:id])
		if @screen.update(screen_params)
			redirect_to user_theatre_path(current_user, @theatre)
		end
	end


	def destroy
		@screen = Screen.find(params[:id])
		if @screen.destroy 
			redirect_to user_allshow_path(current_user,@theatre)
		end
	end


	private
	def screen_params
		params.require(:screen).permit(:name)
	end
end
