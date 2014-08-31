class ChangeUserTocompanyInLeads < ActiveRecord::Migration
  def change
  	rename_column :leads, :user_id, :company_id
  end
end
