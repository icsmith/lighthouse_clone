class Address < ActiveRecord::Base
	validates :address_1, :city, :state, :zip, :phone, presence: true
	validates_length_of :phone, :minimum => 10
	# validates_length_of :phone_2, :minimum => 10
	validates_length_of :zip, :minimum => 5
	validates_length_of :state, :maximum => 2

	belongs_to :customer
end
