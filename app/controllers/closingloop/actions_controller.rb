class Closingloop::ActionsController < ClosingloopsController
require "pry"

	def edit
		@action = Action.find(params[:id])
		@actiontypes = Actiontype.all
		@categories = Category.all
		@lead_categories = @categories.where(lead: true)
		@user = current_user
		@reviewer = User.find(@action.reviewer_id) if @action.reviewed?
	end

	def index
		@actions = Action.filter_by_reviewed_status(params[:reviewed]).order(:id).page(params[:page])
		@reviewed_leads = Action.where(:reviewed == true)
	end

	def update
	  @action = Action.find(params[:id])
	    if @action.update(action_params)
	      binding.pry
	      flash[:success] = "Loop closed!"
	      redirect_to '/closingloop/actions?reviewed=false'
	    else
	      flash[:danger] = "Something Went Wrong! The loop was not closed!"
	      render :edit
	    end 
	end

  private

  def action_params
    params.permit(:call_answered, :is_customer, :category_id, :actiontype_id, :why, :reviewer_id, :reviewed, :spam, :lead)
  end

end    