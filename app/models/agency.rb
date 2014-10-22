class Agency < ActiveRecord::Base
		filterrific(
		default_settings: { with_created_at_gte: 6.months.ago, with_created_at_lt: Time.now },
		filter_names: [
		  :with_nonleadaction_id,
		  :with_reasoninquiry_id,
		  :with_created_at_gte,
		  :with_created_at_lt
		]
	)


	has_many :users
	has_many :companies
	has_many :actions, through: :companies

	scope :with_created_at_gte, lambda { |ref_date|
	  where('leads.created_at >= ?', ref_date.to_date.to_s(:db))
	}

	# always exclude the upper boundary for semi open intervals
	scope :with_created_at_lt, lambda { |ref_date|
	  where('leads.created_at < ?', ref_date.to_date.to_s(:db))
	}

	scope :with_nonleadaction_id, lambda { |nonleadaction_ids|
    	where(nonleadaction_id: [*nonleadaction_ids])
  	}

	scope :with_reasoninquiry_id, lambda { |reasoninquiry_ids|
		where(reasoninquiry_id: [*reasoninquiry_ids])
    }

    scope :this_month, -> { 
    	where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month) 
    }

    scope :group_by_month, -> { group("date('month', created_at)") }

end
