class Opportunity < ActiveRecord::Base
	filterrific(
		default_settings: { with_created_at_gte: 30.days.ago, with_created_at_lt: Time.now },
		filter_names: [
		  :with_created_at_gte,
		  :with_created_at_lt,
		  :where_lead,
		  :with_category_id
		]
	)

	belongs_to :company
	belongs_to :agency
	has_one :actiontype
	belongs_to :category


	scope :with_created_at_gte, lambda { |ref_date|
	  where('opportunities.created_at >= ?', ref_date.to_date.to_s(:db))
	}

	# always exclude the upper boundary for semi open intervals
	scope :with_created_at_lt, lambda { |ref_date|
	  where('opportunities.created_at < ?', ref_date.to_date.to_s(:db))
	}

	scope :where_lead, lambda { |leads|
		includes(:category).where( categories: { lead: true })
    }

    scope :with_category_id, lambda { |category_ids|
    	where(category_id: [*category_ids])
    }


	def self.filter_by_reviewed_status(status)
	  case status
	  when nil     then scoped
	  when 'true'  then where(reviewed: true)
	  when 'false' then where(reviewed: false)
	  end
	end

	def reviewed_opportunities
		self.where(reviewed: true)
	end


	def self.actual_leads
		includes(:category).where( categories: { lead: true })
	end

end
