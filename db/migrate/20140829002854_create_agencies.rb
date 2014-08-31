class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
  	  t.string :company_name
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
      t.timestamps
    end
  end
end
