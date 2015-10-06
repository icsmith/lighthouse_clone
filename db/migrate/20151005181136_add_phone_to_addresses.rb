class AddPhoneToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :phone_2, :string
  end
end
