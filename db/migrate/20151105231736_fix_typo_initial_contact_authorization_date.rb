class FixTypoInitialContactAuthorizationDate < ActiveRecord::Migration
  def change
  	rename_column :customers, :initial_contact_autorization_date, :initial_contact_authorization_date
  end
end
