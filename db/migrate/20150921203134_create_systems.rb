class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
    	t.string :lock_number
    	t.string :test_call_number
    	t.date :battery_date
    	t.date :transponder_date

    	t.integer :system_type_id, null: false
    	t.integer :transponder_type_id, null: false
    	t.integer :customer_id, null: false

      t.timestamps null: false
    end
  end
end
