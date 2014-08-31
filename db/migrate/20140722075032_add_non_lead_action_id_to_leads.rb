class AddNonLeadActionIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :nonleadaction_id, :integer
  end
end
