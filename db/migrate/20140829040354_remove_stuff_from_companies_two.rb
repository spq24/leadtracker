class RemoveStuffFromCompaniesTwo < ActiveRecord::Migration
  def change
  	remove_column :companies, :main_contact_last_name
  	remove_column :companies, :main_contact_email
  end
end
