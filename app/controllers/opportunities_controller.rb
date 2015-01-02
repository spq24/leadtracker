class OpportunitiesController < ApplicationController
	before_filter :require_user

    def new
    	@opportunity = Opportunity.new
    end

    def create
	 	call = JSON.parse(request.body.read)
	 	@company = Company.find_by tracking_number: call["tracking_number"] 
	 	@opportunity = Opportunity.create(tracking_number: call["tracking_number"], caller_phone_number: call["business_number"], customer_name: call["name"], customer_phone: call["caller_number"], call_recording_link: call["audio"], duration: call["duration"], company_id: @company.id )
	end

	def edit
   	 @opportunity = Opportunity.find(params[:id])
    end

    def update
	  @opportunity = Opportunity.find(params[:id])
	    if @opportunity.update(opportunity_params)
	      flash[:success] = "Loop closed!"
	      if params[:controller] == 'opportunities'
	      		redirect_to opportunities_path
	  	  else
	      		redirect_to closingloop_opportunities_path
	      end
	    else
	      flash[:danger] = "Something Went Wrong! The loop was not closed!"
	      redirect_to opportunities_path
	    end 
    end


	def index
		@user = current_user
		@company = @user.company
		@opportunities = Opportunity.order(:id)
		@actiontypes = Actiontype.all
		@categories = Category.all
		@filterrific = Filterrific.new(Opportunity, params[:filterrific] || session[:filterrific_opportunities])
		@company_opportunities = @company.opportunities.where(reviewed: true).filterrific_find(@filterrific).page(params[:page])
		@filterrific.select_options = { with_category_id: @categories.to_a.map { |c| [c.id, c.reason] } }
		session[:filterrific_opportunities] = @filterrific.to_hash
		@opportunities_all_time = @company.opportunities.where(reviewed: true)
		@actual_leads = @company.opportunities.actual_leads
	    @actual_leads_year = @actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day)
	    @actual_leads_sixty = @actual_leads.where(created_at: 60.days.ago..Time.now.beginning_of_day)
	    @actual_leads_thirty = @actual_leads.where(created_at: 30.days.ago..Time.now.beginning_of_day)
		respond_to do |format|
      		format.html
      		format.js
	        format.pdf do
	          pdf = ReportPdf.new(@company_opportunities)
	          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
	        end
    	end

    	  rescue ActiveRecord::RecordNotFound
		    # There is an issue with the persisted param_set. Reset it.
		    redirect_to(opportunity: :reset_filterrific) and return
	end
	

	def reset_filterrific
	    session[:filterrific_opportunities] = nil
	    redirect_to  opportunities_path
  	end

  private

  def opportunity_params
    params.require(:opportunity).permit(:id, :call_answered, :is_customer, :customer_type, :category_id, :actiontype_id, :status, :why, :contractor_invoice, :equipment, :notes, :source, :agency_id, :adf_email, :customer_code, :target_number, :call_status, :opportunity_name, :caller_status, :lead_email, :lead_interest, :lead_phone_number, :lead_comments, :non_customer_type, :reviewer_id)
  end 
end

