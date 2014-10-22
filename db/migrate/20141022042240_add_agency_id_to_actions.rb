class AddAgencyIdToActions < ActiveRecord::Migration
  def change
    add_column :actions, :agency_id, :integer
  end
end
