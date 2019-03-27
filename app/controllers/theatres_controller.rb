class TheatresController < ApplicationController
	
	def new
		@theatre = Theatre.new
	end

	def create
		@theatre = current_user.theatres.create(theatre_params)
		if @theatre.save
			redirect_to user_allshow_path(current_user)
		else
			render "new"
		end
	end

	def allshow
		@theatres = Theatre.all
	end

	def show
		@theatre = Theatre.find(params[:id])
	end

	def edit
		@theatre = current_user.theatres.find(params[:id])
	end

	def update
		@theatre = current_user.theatres.find(params[:id])
		if @theatre.update(theatre_params)
			redirect_to user_theatre_path(current_user, @theatre)
		else
			render 'edit'
		end
	end

	def destroy
		@theatre = current_user.theatres.find(params[:id])
		if @theatre.destroy
			redirect_to user_allshow_path(current_user)
		else
			p "Only current_user can delete"
		end
	end

	private 

	def theatre_params
		params.require(:theatre).permit(:user_id, :name, :address, :contact, :facilities)
	end
end
