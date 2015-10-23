class Caseworker < ActiveRecord::Base
	validates :name, :phone, :fax, presence: true
	validates_length_of :phone, :minimum => 7
	validates_length_of :fax, :minimum => 7

	has_many :customers
end
