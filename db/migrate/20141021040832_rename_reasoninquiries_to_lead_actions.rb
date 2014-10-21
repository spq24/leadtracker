class RenameReasoninquiriesToLeadActions < ActiveRecord::Migration
  def change
  	rename_table :reasoninquiries, :leadactions
  end
end
