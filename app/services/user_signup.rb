class UserSignup

	attr_reader :error_message

	def initialize(user)
		@user = user
	end

	def sign_up
		if @user.valid?

	      if customer.successful?
	        @user.save
	        @status = :success
	        self
	      else
	      	@status = :failed
	      	@error_message = customer.error_message
	      	self
	      end
	    else
	      @status = :failed
	      @error_message = "Oops something went wrong. Please check the information you entered"
	      self
	    end
	end

	def successful?
		@status == :success
	end
end