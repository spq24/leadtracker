class NonleadactionsController < ApplicationController

	
	def new
		@nonleadaction = Nonleadaction.new
	end

	def create
		@user = current_user
		@nonleadaction = Nonleadaction.create(nonleadaction_params)
		if @nonleadaction.save
	      flash[:success] = "You have successfully created a new Non-lead Action Type"
	      redirect_to nonleadactions_path
	    else
	      flash[:danger] = "Something Went Wrong! Your Non-lead Action Types weren't edited properly"
	      render :new
	    end 
	end

	def edit
		@nonleadaction = Nonleadaction.find(params[:id])
	end

	def update
	    @nonleadaction = Nonleadaction.find(params[:id])
	    if @nonleadaction.update_attributes(nonleadaction_params)
	      flash[:success] = "You have successfully edited Your Non-lead Action Types"
	      redirect_to nonleadactions_path
	    else
	      flash[:danger] = "Something Went Wrong! Your Non-lead Action Types weren't edited properly"
	      render :edit
	    end 
	end

	def destroy
		Nonleadaction.find(params[:id]).destroy
	    flash[:success] = "Non-lead Action Type Deleted."
	    redirect_to nonleadactions_path
	end


	def index
    	@nonleadactions = Nonleadaction.all
  	end

	private

	 def nonleadaction_params
    	params.require(:nonleadaction).permit(:reason, :user_id)
  	 end
end
