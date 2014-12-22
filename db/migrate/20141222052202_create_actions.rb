class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
    t.string   :adf_email
    t.string   :customer_code
    t.string   :tracking_number
    t.string   :target_number
    t.string   :customer_name
    t.string   :customer_address
    t.string   :customer_phone
    t.string   :call_recording_link
    t.string   :caller_phone_number
    t.string   :duration
    t.string   :call_status
    t.string   :opportunity_name
    t.string   :caller_status
    t.string   :lead_email
    t.string   :lead_interest
    t.string   :lead_phone_number
    t.string   :lead_comments
    t.integer  :customer_id
    t.integer  :ompany_id
    t.string   :message_type
    t.boolean  :call_answered
    t.boolean  :is_customer
    t.integer  :actiontype_id
    t.integer  :non_customer_type
    t.integer  :category_id
    t.string   :why
    t.integer  :reviewer_id
    t.boolean  :notified
    t.datetime :notified_date
    t.boolean  :reviewed
    t.boolean  :spam
    t.integer  :nonleadaction_id
    t.string   :status
    t.string   :contractor_invoice
    t.string   :equipment
    t.text     :notes
    t.string   :source
    t.integer  :agency_id
    t.boolean  :lead
    t.timestamps
    end
  end
end
