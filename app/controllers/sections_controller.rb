class SectionsController < ApplicationController

	def new
		@screen = Screen.find(params[:screen_id])
		@section = @screen.sections.new
	end

	def create
		@screen = Screen.find(params[:screen_id])
		@section = @screen.sections.create(section_params)
		if @section.save 
			redirect_to user_allshow_path(@section)
		end
	end

	def destroy 
		@section = Section.find(params[:id])
		if @section.destroy
			redirect_to user_allshow_path(current_user,@section)
		end
	end

	private
	def section_params
		params.require(:section).permit(:section_name, :seats, :price)
	end
	
end
