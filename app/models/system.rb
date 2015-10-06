class System < ActiveRecord::Base
	belongs_to :system_type
	belongs_to :transponder_type
	belongs_to :customer
end
