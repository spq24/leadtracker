class SessionsController < ApplicationController

	def new
		redirect_to home_path if current_user    
 	end

	def create
		user = User.where(email: params[:email]).first
		if user && user.authenticate(params[:password])
			if user.active?
				session[:user_id] = user.id
				if user.cl_user?
					redirect_to '/closingloop/leads?reviewed=false'
				elsif user.company_id.present?
					redirect_to company_path(user.company_id)
				elsif user.agency_id.present?
					redirect_to agency_path(user.agency_id)
				elsif user.brand_id.present?
					redirect_to brand_path(user.brand_id)
				else				
					redirect_to '/'
				end
			else
				flash[:danger] = "Your account has been suspended, please contact customer support."
				redirect_to '/sign-in'
			end
		else
			flash[:error] = "Invalid Email or Password."
			redirect_to '/sign-in'
		end
	end

	def destroy
		session[:user_id] = nil
		current_user = nil
		redirect_to root_path
		flash[:success] = "You are now signed out!"
	end
end
