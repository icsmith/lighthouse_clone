class Customer < ActiveRecord::Base
	validates :first_name, :last_name, :sex, :dob, :status, presence: true

	has_one :system, :insurance
	has_many :addresses
	belongs_to :caseworker, :billing_interval, :region
	accepts_nested_attributes_for :address, :system
end
