class Closingloop::ActionsController < ClosingloopsController

	def edit
		@action = Action.find(params[:id])
		@actiontypes = Actiontype.all
		@categories = Category.all
		@user = current_user
		@reviewer = User.find(@action.reviewer_id)
	end

	def index
		@actions = Action.filter_by_reviewed_status(params[:reviewed]).order(:id).page(params[:page])
		@reviewed_leads = Action.where(:reviewed == true)
	end

	def update
	  @action = Action.find(params[:id])
	    if @action.update_attributes(action_params)
	      if Category.find(@action.category_id).lead == true
	      	@action.update_attribute(:lead, true)
	      end
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