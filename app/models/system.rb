class System < ActiveRecord::Base
	validates :system_type, :transmitter_type, presence: true 
	belongs_to :system_type 
	belongs_to :transmitter_type
	belongs_to :customer
end
