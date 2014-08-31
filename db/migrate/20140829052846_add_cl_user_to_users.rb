class AddClUserToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :cl_user, :boolean, default: :true
  end
end
