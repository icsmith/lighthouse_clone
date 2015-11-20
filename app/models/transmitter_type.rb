class TransmitterType < ActiveRecord::Base
	validates :transmitter_type, presence: true, uniqueness: true

	has_many :systems
end
