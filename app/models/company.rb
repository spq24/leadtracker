class Company < ActiveRecord::Base
	has_many :opportunities
	has_many :users
	belongs_to :agency

	has_one :main_contact, class_name: "User"

	def deactivate!
		update_column(:active, "de-activated")
	end

	def months_on_program
		if (Date.today.year * 12 + Date.today.month) - (created_at.year * 12 + created_at.month) == 0
			(Date.today.year * 12 + Date.today.month) - (created_at.year * 12 + created_at.month) + 1
		else
			(Date.today.year * 12 + Date.today.month) - (created_at.year * 12 + created_at.month)
		end
	end


end