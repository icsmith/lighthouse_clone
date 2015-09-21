class CreateCaseworkers < ActiveRecord::Migration
  def change
    create_table :caseworkers do |t|
    	t.string :first_name, null: false, default: ""
    	t.string :last_name, null: false, default: ""
    	t.string :phone, null: false, default: ""
    	t.string :fax, null: false, default: ""

      t.timestamps null: false
    end
  end
end
