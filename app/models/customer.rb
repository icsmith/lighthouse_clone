class Customer < ActiveRecord::Base
	validates :first_name, :last_name, :sex, :dob, :status, presence: true

	has_one :system
	has_one :insurance
	has_many :addresses, dependent: :destroy
	belongs_to :caseworker
	belongs_to :billing_interval
	belongs_to :region
	accepts_nested_attributes_for :addresses
	accepts_nested_attributes_for :system

	

end
