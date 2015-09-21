class TransponderType < ActiveRecord::Base
	validates :transponder_type, presence: true

	has_many :systems
end
