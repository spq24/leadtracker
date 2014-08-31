class ClosingloopsController < ApplicationController
	before_filter :require_cl_user
	before_filter :require_user

	
	private

	def require_cl_user
		if !current_user.cl_user?
			flash[:danger] = "You are not authorized to do that."
			redirect_to '/'
		end
	end
end