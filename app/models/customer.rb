class Customer < ActiveRecord::Base
	validates :first_name, :last_name, :sex, :dob, :status, presence: true

	has_one :address, :system, :insurance
	belongs_to :caseworker, :billing_interval, :region
	accepts_nested_attributes_for :address, :system
end
