class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :adf_email
      t.string :customer_code
      t.string :tracking_number
      t.string :target_number
      t.string :customer_name
      t.string :customer_address
      t.string :customer_phone
      t.string :call_recording_link
      t.string :caller_phone_number
      t.string :duration
      t.string :call_status
      t.string :caller_name
      t.string :caller_status
      t.string :lead_email
      t.string :lead_interest
      t.string :lead_phone_number
      t.string :lead_comments
      t.timestamps
    end
  end
end
