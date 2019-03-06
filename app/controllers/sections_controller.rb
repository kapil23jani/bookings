class SectionsController < ApplicationController

	def new
		@screen = Screen.find(params[:screen_id])
		@section = @screen.sections.new
	end

	def create
		@screen = Screen.find(params[:screen_id])
		@section = @screen.sections.create(section_params)
		if @section.save 
			redirect_to allshow_path(@section)
		end
	end

	private
	def section_params
		params.require(:section).permit(:section_name, :seats, :price)
	end
	
end
