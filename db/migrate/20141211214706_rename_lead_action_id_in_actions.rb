class RenameLeadActionIdInActions < ActiveRecord::Migration
  def change
  	rename_column :actions, :leadaction_id, :category_id
  end
end
