class ChangeMedicaidNumberToString < ActiveRecord::Migration
  def change
  	change_column :insurances, :medicaid_number, :string

  end
end
