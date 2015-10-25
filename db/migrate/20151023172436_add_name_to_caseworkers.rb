class AddNameToCaseworkers < ActiveRecord::Migration
  def change
    add_column :caseworkers, :name, :string
    remove_column :caseworkers, :first_name, :string
    remove_column :caseworkers, :last_name, :string
  end
end
