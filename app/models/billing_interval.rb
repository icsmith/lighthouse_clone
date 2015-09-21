class BillingInterval < ActiveRecord::Base
	validates :billing_interval_name, presence: true

	has_many :customers
end
