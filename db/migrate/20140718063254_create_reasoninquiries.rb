class CreateReasoninquiries < ActiveRecord::Migration
  def change
    create_table :reasoninquiries do |t|

      t.timestamps
    end
  end
end
