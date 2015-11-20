class ChangeTransponderTypesToTransmitterTypes < ActiveRecord::Migration
  def change
  	rename_table :transponder_types, :transmitter_types
  	rename_column :systems, :transponder_date, :transmitter_date
  	rename_column :systems, :transponder_type_id, :transmitter_type_id
  	rename_column :transmitter_types, :transponder_type, :transmitter_type
  end
end
