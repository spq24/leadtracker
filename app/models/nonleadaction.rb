class Nonleadaction < ActiveRecord::Base
	belongs_to :lead


	def self.options_for_select
  		order('id').map { |e| [e.id, e.non_lead_action_type] }
	end
end
