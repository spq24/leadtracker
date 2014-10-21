class Leadaction < ActiveRecord::Base
	belongs_to :action


	def self.options_for_select
  		order('id').map { |e| [e.id, e.reason] }
	end
end
