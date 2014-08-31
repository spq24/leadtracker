class Renameusers < ActiveRecord::Migration
  def change
  	rename_table :users, :companies
  end
end
