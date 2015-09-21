class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
    	t.string :insurance_name, null: false
    	t.string :diagnostics_code
    	t.string :venue
    	t.integer :medicaid_number
    	t.date :isp_end_date

    	t.integer :customer_id, null: false

      t.timestamps null: false
    end
  end
end
