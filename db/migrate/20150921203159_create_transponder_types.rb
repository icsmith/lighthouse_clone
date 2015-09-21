class CreateTransponderTypes < ActiveRecord::Migration
  def change
    create_table :transponder_types do |t|

      t.timestamps null: false
    end
  end
end
