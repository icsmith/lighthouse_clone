class TransponderType < ActiveRecord::Base
	validates :transponder_type, presence: true, uniqueness: true

	has_many :systems
end
