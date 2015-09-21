class Caseworker < ActiveRecord::Base
	validates :first_name, :last_name, :phone, :fax
	validates_length_of :phone, :minimum => 10
	validates_length_of :fax, :minimum => 10

	has_many :customers
end
