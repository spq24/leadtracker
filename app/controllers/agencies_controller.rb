class AgenciesController < ApplicationController
	def show
		@user = current_user
		@agency = @user.agency
	    @companies = @agency.companies.all
	end

	def index
		@user = current_user
		@agency = @user.agency
		@companies = @agency.companies.all



		@actions = Action.order(:id).page(params[:page])
		@filterrific = Filterrific.new(Action, params[:filterrific] || session[:filterrific_actions])
		@filterrific.select_options = { with_leadaction_id: Leadaction.options_for_select, with_nonleadaction_id: Nonleadaction.options_for_select }
		@agency_actions = @agency.actions.where(reviewed: true).filterrific_find(@filterrific).page(params[:page])
		session[:filterrific_actions] = @filterrific.to_hash
		@actiontypes = Actiontype.all
		@nonleadactions = Nonleadaction.all
		@leadactions = Leadaction.all
		@actions_all_time = @agency.actions.where(reviewed: true)
		@actual_leads = @agency.actions.actual_leads
	    @actual_leads_year = @actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day)
	    @actual_leads_sixty = @actual_leads.where(created_at: 60.days.ago..Time.now.beginning_of_day)
	    @actual_leads_thirty = @actual_leads.where(created_at: 30.days.ago..Time.now.beginning_of_day)
	end

	def users
	    @agency = Agency.find(params[:id])
	    @users = @agency.users
	    @user = User.new
 	end


	def reset_filterrific
	    session[:filterrific_actions] = nil
	    redirect_to :action => :index
  	end
end
