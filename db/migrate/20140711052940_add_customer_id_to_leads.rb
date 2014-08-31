class AddCustomerIdToLeads < ActiveRecord::Migration
  def change
  	add_column :leads, :customer_id, :integer
  end
end
