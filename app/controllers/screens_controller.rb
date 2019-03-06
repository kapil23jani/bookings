class ScreensController < ApplicationController



	def new
		@theatre = Theatre.find(params[:theatre_id])
		@screen = @theatre.screens.new
	end

	def create 
		@theatre = Theatre.find(params[:theatre_id])
		@screen = @theatre.screens.create(screen_params)
		if @screen.save 
			redirect_to allshow_path(@screen)
		end
	end

	def edit
		@theatre = Theatre.find(params[:theatre_id])
		@screen = Screen.find(params[:id])
	end

	private
	def screen_params
		params.require(:screen).permit(:name)
	end
end
