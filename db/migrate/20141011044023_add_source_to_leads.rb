class AddSourceToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :source, :string
    Lead.reset_column_information
    Lead.update_all(source: 'website')
  end
end
