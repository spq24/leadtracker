class AddLatlongToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :latlong, :string
  end
end
