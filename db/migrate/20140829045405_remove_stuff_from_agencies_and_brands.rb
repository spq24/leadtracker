class RemoveStuffFromAgenciesAndBrands < ActiveRecord::Migration
  def change
  	remove_column :agencies, :password
  	remove_column :agencies, :last_login_date
  	remove_column :brands, :password
  	remove_column :brands, :last_login_date
  end
end
