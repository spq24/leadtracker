class AddLeadToActions < ActiveRecord::Migration
  def change
    add_column :actions, :lead, :boolean
  end
end
