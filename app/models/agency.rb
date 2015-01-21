class Agency < ActiveRecord::Base
	filterrific(
		default_settings: { with_created_at_gte: 6.months.ago, with_created_at_lt: Time.now },
		filter_names: [
		  :with_companies,
		  :with_created_at_gte,
		  :with_created_at_lt,
		  :with_category_id,
		  :where_lead
		]
	)


	has_many :users
	has_many :companies
	has_many :opportunities, through: :companies

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

	scope :with_companies, lambda { |company_id|
    	where([
	    	  %(
	    		EXISTS (
	    			SELECT 1
	    			FROM companies
	    			WHERE agency.id = companies.agency_id)
	    		),
    			company_id
    		  ])
  	}

end
