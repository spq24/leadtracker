class AddAgencyIdToNonLeadActions < ActiveRecord::Migration
  def change
    add_column :nonleadactions, :agency_id, :integer
  end
end
