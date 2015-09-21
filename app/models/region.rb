class Region < ActiveRecord::Base
	validates :region_name, presence: true

	has_many :customers
end
