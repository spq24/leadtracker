class ChangeReviwerIdName < ActiveRecord::Migration
  def change
  	rename_column :leads, :reviwer_id, :reviewer_id
  end
end
