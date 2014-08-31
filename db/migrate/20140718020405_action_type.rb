class ActionType < ActiveRecord::Migration
  def change
  	create_table :action_types do |t|
      t.string :action_type
      t.string :user_id
      t.timestamps
    end
  end
end
