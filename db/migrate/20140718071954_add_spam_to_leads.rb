class AddSpamToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :spam, :boolean
  end
end
