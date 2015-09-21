class System < ActiveRecord::Base
	belongs_to :system_type, :transponder_type, :customer
end
