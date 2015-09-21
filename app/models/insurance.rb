class Insurance < ActiveRecord::Base
	validates :insurance_name, presence: true

	belongs_to :customer
end
