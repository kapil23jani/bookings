module ScreensHelper
	def screen_model
		@screen = Screen.find_by(:params[:screen_id])
	end
end
