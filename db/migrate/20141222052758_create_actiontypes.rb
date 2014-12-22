class CreateActiontypes < ActiveRecord::Migration
  def change
    create_table :actiontypes do |t|
    	t.string   :action_type
    	t.string   :user_id
    	t.timestamps
    end
  end
end
