class Region < ActiveRecord::Base
	validates :region_name, presence: true, uniqueness: true

	has_many :customers
end
