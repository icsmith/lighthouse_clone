class SystemType < ActiveRecord::Base
	validates :system_type, presence: true

	has_many :systems
end
