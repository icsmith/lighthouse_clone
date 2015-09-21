class CreateTransponderTypes < ActiveRecord::Migration
  def change
    create_table :transponder_types do |t|
    	t.string :transponder_type, null: false
      t.timestamps null: false
    end
  end
end
