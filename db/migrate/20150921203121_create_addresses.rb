class CreateAddresses < ActiveRecord::Migration
	def change
		create_table :addresses do |t|
			t.string :address_1, null: false, default: ""
			t.string :address_2
			t.string :city, null: false, default: ""
			t.string :state, null: false, default: ""
			t.string :zip, null: false, default: ""
			t.string :phone, null: false, default: ""
			t.boolean :is_billing_address, null: false, default: false
			# phone_2 string added in seperate migraiton
    	t.integer :customer_id, null: false

			t.timestamps null: false
		end
	end
end
