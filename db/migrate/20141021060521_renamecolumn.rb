class Renamecolumn < ActiveRecord::Migration
  def change
  	rename_column :nonleadactions, :non_lead_action_type, :reason
  end
end
