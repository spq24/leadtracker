class AddUserIdToLeadactions < ActiveRecord::Migration
  def change
    add_column :leadactions, :user_id, :integer
  end
end
