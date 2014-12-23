class Closingloop::OpportunitiesController < ClosingloopsController
require "pry"

	def edit
		@opportunity = Opportunity.find(params[:id])
		@actiontypes = Actiontype.all
		@categories = Category.all
		@lead_categories = @categories.where(lead: true)
		@user = current_user
		@reviewer = User.find(@Opportunity.reviewer_id) if @Opportunity.reviewed?
	end

	def index
		@opportunities = Opportunity.filter_by_reviewed_status(params[:reviewed]).order(:id).page(params[:page])
		@reviewed_leads = Opportunity.where(reviewed: true)
	end

	def update
	  @opportunity = Opportunity.find(params[:id])
	    if @opportunity.update(opportunity_params)
	      flash[:success] = "Loop closed!"
	      redirect_to '/closingloop/opportunities?reviewed=false'
	    else
	      flash[:danger] = "Something Went Wrong! The loop was not closed!"
	      render :edit
	    end 
	end

  private

  def opportunity_params
    params.require(:opportunity).permit(:call_answered, :is_customer, :category_id, :actiontype_id, :why, :reviewer_id, :reviewed, :spam, :lead)
  end

end    