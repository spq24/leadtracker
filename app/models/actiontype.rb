class Actiontype < ActiveRecord::Base
	belongs_to :action


	def self.options_for_select
  		order('action_type').map { |e| e.id }
	end
end
