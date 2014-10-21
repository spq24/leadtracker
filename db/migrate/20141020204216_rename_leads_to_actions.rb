class RenameLeadsToActions < ActiveRecord::Migration
  def change
  	rename_table :leads, :actions
  end
end
