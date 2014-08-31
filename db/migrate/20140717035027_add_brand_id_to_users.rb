class AddBrandIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :brand_id, :integer
    add_column :users, :agency_id, :integer
  end
end
