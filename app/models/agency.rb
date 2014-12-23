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
	has_many :opportunities, through: :companies


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
