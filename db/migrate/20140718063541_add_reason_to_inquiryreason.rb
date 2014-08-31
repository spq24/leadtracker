class AddReasonToInquiryreason < ActiveRecord::Migration
  def change
    add_column :reasoninquiries, :reason, :string
  end
end
