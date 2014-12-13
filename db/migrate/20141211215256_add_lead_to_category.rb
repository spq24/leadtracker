class AddLeadToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :lead, :boolean
  end
end
