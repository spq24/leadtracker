class AddValueToLeadActions < ActiveRecord::Migration
  def change
  	add_column :leadactions, :value, :integer
  end
end
