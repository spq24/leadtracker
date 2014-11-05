class Agency < ActiveRecord::Base
	filterrific(
		default_settings: { with_created_at_gte: 6.months.ago, with_created_at_lt: Time.now },
		filter_names: [
		  :with_companies,
		  :with_created_at_gte,
		  :with_created_at_lt
		]
	)


	has_many :users
	has_many :companies
	has_many :actions, through: :companies
	has_many :leadactions, through: :actions
	has_many :nonleadactions, through: :nonleadactions

	scope :with_created_at_gte, lambda { |ref_date|
	  where('leads.created_at >= ?', ref_date.to_date.to_s(:db))
	}

	# always exclude the upper boundary for semi open intervals
	scope :with_created_at_lt, lambda { |ref_date|
	  where('leads.created_at < ?', ref_date.to_date.to_s(:db))
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
