class Brand < ActiveRecord::Base
	has_many :agencies
	has_many :companies, through: :agencies
	has_many :users
end
