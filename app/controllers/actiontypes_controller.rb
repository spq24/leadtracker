class ActiontypesController < ApplicationController
	def new
		@actiontype = Actiontype.new
	end

	def create
		@user = current_user
		@actiontype = Actiontype.create(actiontype_params)
		if @actiontype.save
	      flash[:success] = "You have successfully created a new Action Type"
	      redirect_to actiontypes_path
	    else
	      flash[:danger] = "Something Went Wrong! Your Action actiontype wasn't edited properly"
	      render :new
	    end 
	end

	def edit
		@actiontype = Actiontype.find(params[:id])
	end

	def update
	    @actiontype = Actiontype.find(params[:id])
	    if @actiontype.update_attributes(actiontype_params)
	      flash[:success] = "You have successfully edited Your Action Type"
	      redirect_to actiontypes_path
	    else
	      flash[:danger] = "Something Went Wrong! Your Action Type wasn't edited properly"
	      render :edit
	    end 
	end

	def destroy
		Actiontype.find(params[:id]).destroy
	    flash[:success] = "Action Action Type Deleted."
	    redirect_to actiontypes_path
	end


	def index
    	@actiontypes = Actiontype.all
  	end

	private

	 def actiontype_params
    	params.require(:actiontype).permit(:action_type, :user_id)
  	 end
end
