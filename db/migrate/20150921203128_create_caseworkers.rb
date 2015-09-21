class CreateCaseworkers < ActiveRecord::Migration
  def change
    create_table :caseworkers do |t|

      t.timestamps null: false
    end
  end
end
