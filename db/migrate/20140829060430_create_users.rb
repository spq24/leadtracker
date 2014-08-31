class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phonenumber
      t.string :password
      t.text   :admin_notes
      t.datetime :last_login_date
      t.string :status
      t.integer :company_id
      t.integer :agency_id
      t.integer :brand_id
      t.boolean :cl_user
      t.boolean :kinertia_employee
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
