class ChangeReasonName < ActiveRecord::Migration
  def change
  	rename_column :leads, :reason_inquiry, :reasoninquiry_id
  end
end
