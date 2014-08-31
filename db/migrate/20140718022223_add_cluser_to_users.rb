class AddCluserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cl_user, :boolean
  end
end
