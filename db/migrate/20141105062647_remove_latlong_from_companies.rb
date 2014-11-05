class RemoveLatlongFromCompanies < ActiveRecord::Migration
  def change
  	remove_column :companies, :latlong
  end
end
