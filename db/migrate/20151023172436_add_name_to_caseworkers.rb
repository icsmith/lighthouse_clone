class AddNameToCaseworkers < ActiveRecord::Migration
  def change
    add_column :caseworkers, :name, :string
    remove_column :caseworkers, :first_name
    remove_column :caseworkers, :last_name
  end
end
