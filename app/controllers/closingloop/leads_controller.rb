class Closingloop::LeadsController < ClosingloopsController

	def edit
		@lead = Lead.find(params[:id])
		@actiontypes = Actiontype.all
		@nonleadactions = Nonleadaction.all
		@inquiryreasons = Reasoninquiry.all
		@user = current_user
	end

	def index
		@leads = Lead.filter_by_reviewed_status(params[:reviewed]).order(:id).page(params[:page])
		@reviewed_leads = Lead.where(:reviewed == true)
	end

	def update
	  @lead = Lead.find(params[:id])
	    if @lead.update_attributes(lead_params)
	      flash[:success] = "Loop closed!"
	      redirect_to '/closingloop/leads?reviewed=false'
	    else
	      flash[:danger] = "Something Went Wrong! The loop was not closed!"
	      render :edit
	    end 
	end

  private

  def lead_params
    params.require(:lead).permit(:call_answered, :is_customer, :reasoninquiry_id, :actiontype_id, :why, :reviewer_id, :reviewed, :spam, :nonleadaction_id)
  end

end    