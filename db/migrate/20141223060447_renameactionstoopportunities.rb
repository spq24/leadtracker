class Renameactionstoopportunities < ActiveRecord::Migration
  def change
  	rename_table :actions, :opportunities
  end
end
