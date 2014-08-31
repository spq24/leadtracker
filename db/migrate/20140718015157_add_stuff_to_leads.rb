class AddStuffToLeads < ActiveRecord::Migration
  def change
  	add_column :leads, :message_type, :string
  	add_column :leads, :call_answered, :boolean
  	add_column :leads, :is_customer, :boolean
  	add_column :leads, :customer_type, :integer
  	add_column :leads, :non_customer_type, :integer
  	add_column :leads, :reason_inquiry, :integer
  	add_column :leads, :why, :string
  	add_column :leads, :reviwer_id, :integer
  	add_column :leads, :notified, :boolean
  	add_column :leads, :notified_date, :datetime
  end
end
