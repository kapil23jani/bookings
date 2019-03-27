class CastsController < ApplicationController

  def index
    @casts = Cast.all
  end

  def new
    @cast = current_user.casts.new
  end

  def create
    @cast = current_user.casts.create(cast_params)
    if @cast.save
      redirect_to welcome_index_path(current_user)
    else
      render "new"
    end
  end


  def assign_cast
    @assign_cast = Movie.find(params[:format]) 
    @casts = current_user.casts
  end


  private
  
  def cast_params
    params.require(:cast).permit(:name, :cast_image)
  end
end
