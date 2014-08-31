class AddMainContactIdToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :main_contact_id, :integer
  end
end
