class NonLeadActions < ActiveRecord::Migration
  def change
  	create_table :non_lead_actions do |t|
      t.string :non_lead_action_type
      t.string :user_id
      t.timestamps
    end
  end
end

