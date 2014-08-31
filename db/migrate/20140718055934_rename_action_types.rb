class RenameActionTypes < ActiveRecord::Migration
  def change
  	rename_table :action_types, :actiontypes
  end
end
