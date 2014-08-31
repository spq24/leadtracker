class RemoveStuffFromCompaniesThree < ActiveRecord::Migration
  def change
  	remove_column :companies, :cl_user
  	remove_column :companies, :password_digest
  	remove_column :companies, :parent
  end
end
