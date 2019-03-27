class SectionsController < ApplicationController

  def new
    @screen = Screen.find(params[:screen_id])
    @section = @screen.sections.new
  end

  def create
    @theatre = Theatre.find(params[:theatre_id])
    @screen = Screen.find(params[:screen_id])
    @section = @screen.sections.find_or_create_by(section_params)
    if @section.save 
      redirect_to user_theatre_path(current_user,@screen.theatre_id)
    else 
      render 'new'
    end

  end

  def edit
    @theatre = Theatre.find(params[:theatre_id])
    @screen = Screen.find(params[:screen_id])
    @section = Section.find(params[:id])
  end

  def update
    @theatre = Theatre.find(params[:theatre_id])
    @screen = Screen.find(params[:screen_id])
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to user_theatre_path(current_user,@screen.theatre_id)
    else
      render 'edit'
    end
  end

  def destroy 
    @theatre = Theatre.find(params[:theatre_id])
    @section = Section.find(params[:id])
    if @section.destroy
      redirect_to user_theatre_path(current_user,@theatre)
    end
  end

  private
  
  def section_params
    params.require(:section).permit(:section_name, :seats, :price)
  end
  
end
