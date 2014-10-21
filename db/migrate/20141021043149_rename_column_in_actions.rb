class RenameColumnInActions < ActiveRecord::Migration
  def change
  	rename_column :actions, :reasoninquiry_id, :leadaction_id
  end
end
