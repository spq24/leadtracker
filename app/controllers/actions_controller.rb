class ActionsController < ApplicationController
	before_filter :require_user

    def new
    	@action = Action.new
    end

    def create
	 	call = JSON.parse(request.body.read)
	 	@company = Company.find_by tracking_number: call["tracking_number"] 
	 	@action = Action.create(tracking_number: call["tracking_number"], caller_phone_number: call["business_number"], customer_name: call["name"], customer_phone: call["caller_number"], call_recording_link: call["audio"], duration: call["duration"], company_id: @company.id )
	end

	def edit
   	 @action = Action.find(params[:id])
    end

    def update
	  action = Action.find(params[:id])
	    if action.update_attributes(action_params)
	      flash[:success] = "Loop closed!"
	      if params[:controller] == 'actions'
	      		redirect_to action: :index
	  	  else
	      		redirect_to closingloop_actions_path
	      end
	    else
	      flash[:danger] = "Something Went Wrong! The loop was not closed!"
	      render :edit
	    end 
    end


	def index
		@user = current_user
		@company = @user.company
		@actions = Action.order(:id).page(params[:page])
		@filterrific = Filterrific.new(Action, params[:filterrific] || session[:filterrific_actions])
		@filterrific.select_options = { with_leadaction_id: Leadaction.options_for_select, with_nonleadaction_id: Nonleadaction.options_for_select }
		@company_actions = @company.actions.where(reviewed: true).filterrific_find(@filterrific).page(params[:page])
		session[:filterrific_actions] = @filterrific.to_hash
		@actiontypes = Actiontype.all
		@nonleadactions = Nonleadaction.all
		@leadactions = Leadaction.all
		@actions_all_time = @company.actions.where(reviewed: true)
		@actual_leads = @company.actions.actual_leads
	    @actual_leads_year = @actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day)
	    @actual_leads_sixty = @actual_leads.where(created_at: 60.days.ago..Time.now.beginning_of_day)
	    @actual_leads_thirty = @actual_leads.where(created_at: 30.days.ago..Time.now.beginning_of_day)

		respond_to do |format|
      		format.html
      		format.js
	        format.pdf do
	          pdf = ReportPdf.new(@company_actions)
	          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
	        end
    	end

    	  rescue ActiveRecord::RecordNotFound
		    # There is an issue with the persisted param_set. Reset it.
		    redirect_to(action: :reset_filterrific) and return
	end
	

	def reset_filterrific
	    session[:filterrific_actions] = nil
	    redirect_to :action => :index
  	end

  private

  def action_params
    params.require(:action).permit(:call_answered, :is_customer, :customer_type, :leadaction_id, :nonleadaction_id, :actiontype_id, :status, :why, :reviewed, :created_at, :tracking_number, :caller_phone_number, :customer_name, :customer_phone, :call_recording_link, :duration, :company_id, :contractor_invoice, :equipment, :notes, :source, :agency_id,     :adf_email, :customer_code, :target_number, :call_status, :opportunity_name, :caller_status, :lead_email, :lead_interest, :lead_phone_number, :lead_comments, :non_customer_type, :reviewer_id, :notified, :notified_date, :spam)
  end 
end

