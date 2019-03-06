class TheatresController < ApplicationController
	def index
		@theatres = Theatre.all
	end

	def new
		@theatre = Theatre.new
	end

	def create
		@theatre = Theatre.create(theatre_params)
		if @theatre.save
			redirect_to allshow_path(@theatre)
		end
	end

	def allshow
		@theatres = Theatre.all
	end

	def show
		@theatre = Theatre.find(params[:id])
	end

	def edit
		@theatre = Theatre.find(params[:id])
	end

	def update
		@theatre = Theatre.find(params[:id])
		if @theatre.update(theatre_params)
			redirect_to allshow_path(@theatre)
		else
			render 'edit'
		end
	end

	def destroy
		@theatre = Theatre.find(params[:id])
		if @theatre.destroy
			redirect_to allshow_path(@theatre)
		end
	end




	private 

	def theatre_params
		params.require(:theatre).permit(:name, :address, :contact, :facilities)
	end
end
