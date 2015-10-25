class ChangeAccountNumberToString < ActiveRecord::Migration
  def change
  	change_column :customers, :client_central_station_account_number, :string
  end
end
