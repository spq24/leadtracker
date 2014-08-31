class RenameNonLeadActions < ActiveRecord::Migration
  def change
  	rename_table :non_lead_actions, :nonleadactions
  end
end
