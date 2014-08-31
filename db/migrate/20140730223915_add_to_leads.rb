class AddToLeads < ActiveRecord::Migration
  def change
  	add_column :leads, :contractor_invoice, :string
  	add_column :leads, :equipment, :string
  	add_column :leads, :notes, :text
  end
end
