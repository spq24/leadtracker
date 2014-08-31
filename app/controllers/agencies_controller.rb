class AgenciesController < ApplicationController
	def show
		@user = current_user
		@agency = @user.agency
	    @companies = @agency.companies.all
	end
end
