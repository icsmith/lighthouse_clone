class CreateBillingIntervals < ActiveRecord::Migration
  def change
    create_table :billing_intervals do |t|
    	t.string :billing_interval_name, null: false

      t.timestamps null: false
    end
  end
end
