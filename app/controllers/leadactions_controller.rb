class LeadactionsController < ApplicationController
	
	def new
		@leadaction = Leadaction.new
	end

	def create
		@user = current_user
		@leadaction = Leadaction.create(leadaction_params)
		if @leadaction.save
	      flash[:success] = "You have successfully created a new Lead Action Type"
	      redirect_to leadactions_path
	    else
	      flash[:danger] = "Something Went Wrong! Your Lead Action Types weren't edited properly"
	      render :new
	    end 
	end

	def edit
		@leadaction = Leadaction.find(params[:id])
	end

	def update
	    @leadaction = Leadaction.find(params[:id])
	    if @leadaction.update_attributes(leadaction_params)
	      flash[:success] = "You have successfully edited Your Lead Action Types"
	      redirect_to leadactions_path
	    else
	      flash[:danger] = "Something Went Wrong! Your Lead Action Types weren't edited properly"
	      render :edit
	    end 
	end

	def destroy
		Leadaction.find(params[:id]).destroy
	    flash[:success] = "Lead Action Type Deleted."
	    redirect_to leadactions_path
	end


	def index
    	@leadactions = Leadaction.all
  	end

	private

	 def leadaction_params
    	params.require(:leadaction).permit(:reason, :user_id)
  	 end
end
