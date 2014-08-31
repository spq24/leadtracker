class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :company_name
      t.string :main_contact_first_name
      t.string :main_contact_last_name
      t.string :main_contact_email
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :postcode
      t.string :country
      t.string :phonenumber
      t.string :password
      t.text   :admin_notes
      t.datetime :last_login_date
      t.string :website_url
      t.string :tracking_phone_number
      t.string :web_design
      t.string :google_account
      t.string :google_password
      t.string :google_maps_status
      t.text :google_maps_notes
      t.string :google_maps_url
      t.string :google_verified_date
      t.string :youtube_channel_url
      t.string :bing_account
      t.string :bing_password
      t.string :bing_places_status
      t.text :bing_places_notes
      t.string :bing_places_url
      t.string :bing_verified_date
      t.string :yelp_account
      t.string :yelp_password
      t.string :yelp_status
      t.text :yelp_notes
      t.string :yelp_url
      t.string :yelp_verified_date
      t.string :yahoo_account
      t.string :yahoo_password
      t.string :yahoo_local_status
      t.text :yahoo_local_notes
      t.string :yahoo_local_url
      t.string :yahoo_verified_date
      t.text :keywords
      t.string :last_attempt_to_contact
      t.boolean :instant_call_notification
      t.string :package
      t.integer :package_price
      t.boolean :customer_content_survey
      t.string :status
      t.timestamps
    end
  end
end
