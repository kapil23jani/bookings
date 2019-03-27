class ProfileManagersController < ApplicationController

    def new
        @profile = current_user.build_profile_manager
    end

    def create
        @profile = current_user.create_profile_manager(profile_params)
        if @profile.save
            redirect_to welcome_index_path
        else
          render 'new'
        end
    end

    def show
        @profile = ProfileManager.find(params[:id])
    end

    def edit
        @user = current_user
        @profile = ProfileManager.find(params[:id])
    end

    def update
        @profile = ProfileManager.find(params[:id])
        if @profile.update(profile_params)
            redirect_to user_profile_manager_path(@profile)
        else
            render 'new'
        end
    end

    def destroy 
        @profile = ProfileManager.find(params[:id])
        if @profile.destroy
            redirect_to welcome_index_path
        end
    end

    private

    def profile_params
        params.require(:profile_manager).permit(:name, :gender, :address, :experience, :picture)
    end
end

