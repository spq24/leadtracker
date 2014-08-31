class AddStuffToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :agency_id, :brand_id
  end
end
