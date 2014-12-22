class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
	    t.string   :reason
	    t.integer  :user_id
	    t.integer  :value
	    t.integer  :agency_id
	    t.boolean  :lead
    end
  end
end
