class AddReviewedToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :reviewed, :boolean
  end
end
