class AddAgencyIdToLeadActions < ActiveRecord::Migration
  def change
    add_column :leadactions, :agency_id, :integer
  end
end
