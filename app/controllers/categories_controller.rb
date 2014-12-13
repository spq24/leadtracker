class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end

	def create
		@user = current_user
		@category = Category.create(category_params)
		if @category.save
	      flash[:success] = "You have successfully created a new Action Category"
	      redirect_to categories_path
	    else
	      flash[:danger] = "Something Went Wrong! Your Action Category wasn't edited properly"
	      render :new
	    end 
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
	    @category = Category.find(params[:id])
	    if @category.update_attributes(category_params)
	      flash[:success] = "You have successfully edited Your Action Category"
	      redirect_to categories_path
	    else
	      flash[:danger] = "Something Went Wrong! Your Action Category wasn't edited properly"
	      render :edit
	    end 
	end

	def destroy
		Category.find(params[:id]).destroy
	    flash[:success] = "Action Category Deleted."
	    redirect_to categories_path
	end


	def index
    	@categories = Category.all
  	end

	private

	 def category_params
    	params.require(:category).permit(:reason, :value, :lead, :user_id)
  	 end
end
