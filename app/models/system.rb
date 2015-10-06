class System < ActiveRecord::Base
	validates :system_type, :transponder_type, presence: true 
	belongs_to :system_type 
	belongs_to :transponder_type
	belongs_to :customer
end
