class SystemType < ActiveRecord::Base
	validates :system_type, presence: true, uniqueness: true

	has_many :systems, dependent: :destroy
end
