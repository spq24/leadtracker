class Company < ActiveRecord::Base
		filterrific(
		default_settings: { with_created_at_gte: 30.days.ago, with_created_at_lt: Time.now },
		filter_names: [
		  :with_created_at_gte,
		  :with_created_at_lt
		]
	)

	has_many :opportunities
	has_many :users
	belongs_to :agency

	has_one :main_contact, class_name: "User"


	scope :with_created_at_gte, lambda { |ref_date|
	  where('opportunities.created_at >= ?', ref_date.to_date.to_s(:db))
	}

	# always exclude the upper boundary for semi open intervals
	scope :with_created_at_lt, lambda { |ref_date|
	  where('opportunities.created_at < ?', ref_date.to_date.to_s(:db))
	}



	def deactivate!
		update_column(:active, false)
	end

	def months_on_program
		if (Date.today.year * 12 + Date.today.month) - (created_at.year * 12 + created_at.month) == 0
			(Date.today.year * 12 + Date.today.month) - (created_at.year * 12 + created_at.month) + 1
		else
			(Date.today.year * 12 + Date.today.month) - (created_at.year * 12 + created_at.month)
		end
	end

	def leads_breakdown
		e = self.opportunities.group(:category_id).distinct.count.to_a.drop(1).flatten
		evalues = e.values_at(* e.each_index.select {|i| i.even?})
		Category.find(evalues).map { |c| [c.reason, c.id]  }
	end

	def source_breakdown
		e = self.opportunities.group(:source).distinct.count.to_a
	end

	def company_opportunities
		Opportunity.where(reviewed: true, company_id: self.id)
	end


end