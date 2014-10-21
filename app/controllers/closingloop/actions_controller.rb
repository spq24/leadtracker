class Closingloop::ActionsController < ClosingloopsController

	def edit
		@lead = Lead.find(params[:id])
		@actiontypes = Actiontype.all
		@nonleadactions = Nonleadaction.all
		@leadactions = Leadactions.all
		@user = current_user
	end

	def index
		@actions = Action.filter_by_reviewed_status(params[:reviewed]).order(:id).page(params[:page])
		@reviewed_leads = Action.where(:reviewed == true)
	end

	def update
	  @action = Action.find(params[:id])
	    if @action.update_attributes(lead_params)
	      flash[:success] = "Loop closed!"
	      redirect_to '/closingloop/leads?reviewed=false'
	    else
	      flash[:danger] = "Something Went Wrong! The loop was not closed!"
	      render :edit
	    end 
	end

  private

  def lead_params
    params.require(:action).permit(:call_answered, :is_customer, :leadaction_id, :actiontype_id, :why, :reviewer_id, :reviewed, :spam, :nonleadaction_id)
  end

end    