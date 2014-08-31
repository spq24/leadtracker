class User < ActiveRecord::Base
	belongs_to :company
	belongs_to :agency
	belongs_to :brand
	has_secure_password validations: false

	def deactivate!
		update_column(:active, "de-activated")
	end

	
end
