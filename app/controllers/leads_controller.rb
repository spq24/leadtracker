class LeadsController < ApplicationController
	before_filter :require_user

	def index
		@user = current_user
		@company = @user.company
		@leads = Lead.order(:id).page(params[:page])
		@filterrific = Filterrific.new(Lead, params[:filterrific] || session[:filterrific_leads])
		@filterrific.select_options = { with_reasoninquiry_id: Reasoninquiry.options_for_select, with_nonleadaction_id: Nonleadaction.options_for_select }
		@company_leads = @company.leads.where(reviewed: true).filterrific_find(@filterrific).page(params[:page])
		session[:filterrific_leads] = @filterrific.to_hash
		@actiontypes = Actiontype.all
		@nonleadactions = Nonleadaction.all
		@inquiryreasons = Reasoninquiry.all
		@actions_all_time = @company.leads.where(reviewed: true)
		@actual_leads = @company.leads.actual_leads
	    @actual_leads_year = @actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day)
	    @actual_leads_sixty = @actual_leads.where(created_at: 60.days.ago..Time.now.beginning_of_day)
	    @actual_leads_thirty = @actual_leads.where(created_at: 30.days.ago..Time.now.beginning_of_day)
		@bymonthleads = @actual_leads.group_by { |lead| lead.created_at.beginning_of_month.strftime("%B")}
		respond_to do |format|
      		format.html
      		format.js
	        format.pdf do
	          pdf = ReportPdf.new(@company_leads)
	          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
	        end
    	end

    	  rescue ActiveRecord::RecordNotFound
		    # There is an issue with the persisted param_set. Reset it.
		    redirect_to(action: :reset_filterrific) and return
	end
	
	def update
	  @lead = Lead.find(params[:id])
	    if @lead.update_attributes(lead_params)
	      flash[:success] = "Loop closed!"
	      if params[:controller] == 'leads'
	      		redirect_to action: :index
	  	  else
	      		redirect_to closingloop_leads_path
	      end
	    else
	      flash[:danger] = "Something Went Wrong! The loop was not closed!"
	      render :edit
	    end 
	end

	def reset_filterrific
	    session[:filterrific_leads] = nil
	    redirect_to :action => :index
  	end

  def new
    @lead = Lead.new
  end

  def create
 	call = JSON.parse(request.body.read)
 	@company = Company.find_by tracking_number: call["tracking_number"] 
 	@lead = Lead.create(tracking_number: call["tracking_number"], caller_phone_number: call["business_number"], customer_name: call["name"], customer_phone: call["caller_number"], call_recording_link: call["audio"], duration: call["duration"], company_id: @company.id )
  end

  private

  def lead_params
    params.require(:lead).permit(:call_answered, :is_customer, :customer_type, :reasoninquiry_id, :nonleadaction_id, :actiontype_id, :status, :why, :reviewed, :created_at, :tracking_number, :caller_phone_number, :customer_name, :customer_phone, :call_recording_link, :duration, :company_id)
  end
end
