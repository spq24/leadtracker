class Lead < ActiveRecord::Base
	filterrific(
		default_settings: { with_created_at_gte: 30.days.ago, with_created_at_lt: Time.now, with_reasoninquiry_id: [1,2,3] },
		filter_names: [
		  :with_nonleadaction_id,
		  :with_reasoninquiry_id,
		  :with_created_at_gte,
		  :with_created_at_lt
		]
	)

	belongs_to :company
	has_one :actiontype
	has_one :reasoninquiry
	has_one :nonleadaction


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

	def self.filter_by_reviewed_status(status)
	  case status
	  when nil     then scoped
	  when 'true'  then where(reviewed: true)
	  when 'false' then where(reviewed: false)
	  end
	end

	def self.actual_leads
		where(reasoninquiry_id: [1,2,3])
	end

	def pie_actions(array)
      # slice array to get index 0 of each sub array
      sliceArray = array[0..2].map { |row| row[0] }
      # create a hash with appropriate values
      strHash = { 1 => "google", 2 => "facebook", 3 => "reddit" }; 
      # map the values to your sliced array
      webMap = sliceArray.map { |e| strHash[e] }
      # slice array again for index 1 of each sub array
      sliceIndexOne = array[0..2].map { |row| row[1] }
      #merge two new arrays
      mergedArray = webMap.zip(sliceIndexOne)
      # return array  
      return mergedArray
	end

end
