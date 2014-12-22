class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
	    t.string   :company_name
	    t.string   :address_one
	    t.string   :address_two
	    t.string   :city
	    t.string   :state
	    t.string   :zip
	    t.string   :postcode
	    t.string   :country
	    t.string   :phonenumber
	    t.text     :admin_notes
	    t.string   :website_url
	    t.timestamps
    end
  end
end
