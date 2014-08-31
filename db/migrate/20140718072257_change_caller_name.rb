class ChangeCallerName < ActiveRecord::Migration
  def change
  	rename_column :leads, :caller_name, :opportunity_name
  end
end
