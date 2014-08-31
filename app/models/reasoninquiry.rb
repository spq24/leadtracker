class Reasoninquiry < ActiveRecord::Base
	belongs_to :lead


	def self.options_for_select
  		order('id').map { |e| [e.id, e.reason] }
	end
end
