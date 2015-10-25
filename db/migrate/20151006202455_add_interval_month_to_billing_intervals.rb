class AddIntervalMonthToBillingIntervals < ActiveRecord::Migration
  def change
    add_column :billing_intervals, :interval_month, :integer
end
end
