class AddStuffToUsersThree < ActiveRecord::Migration
  def change
  	add_column :users, :kinertia_employee, :boolean
  end
end
