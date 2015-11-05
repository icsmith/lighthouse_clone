class Customer < ActiveRecord::Base
	validates :first_name, :last_name, :sex, :dob, :status, presence: true
	validates :first_name, uniqueness: {scope: [:last_name, :dob], message: "This customer already exists (first, last, dob)"}

	has_one :system, dependent: :destroy
	has_one :insurance, dependent: :destroy
	has_many :addresses, dependent: :destroy
	belongs_to :caseworker
	belongs_to :billing_interval
	belongs_to :region
	accepts_nested_attributes_for :addresses
	accepts_nested_attributes_for :system

	

end
