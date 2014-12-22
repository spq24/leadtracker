class RenameColumnInActions < ActiveRecord::Migration
  def change
  	rename_column :actions, :ompany_id, :company_id
  end
end
