class ChangeCustomerType < ActiveRecord::Migration
  def change
  	rename_column :leads, :customer_type, :actiontype_id
  end
end
