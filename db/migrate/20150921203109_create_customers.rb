class CreateCustomers < ActiveRecord::Migration
	def change
		create_table :customers do |t|
			t.string :first_name, null: false, default: ""
			t.string :last_name, null: false, default: ""
			t.string :middle_initial
			t.string :sex, null: false, default: ""
			t.date :dob, null: false
			t.string :language
			t.text :memo
			t.integer :status, null: false, default: 1
			t.string :status_note
			t.integer :client_central_station_account_number
			t.date :install_date
			t.date :cancel_date
			t.date :initial_contact_autorization_date

			t.integer :region_id
			t.integer :billing_interval_id
			t.integer :caseworker_id

			t.timestamps null: false
		end
	end
end
