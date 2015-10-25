class BillingInterval < ActiveRecord::Base
	validates :billing_interval_name, :interval_month, presence: true
	validates_uniqueness_of :billing_interval_name, scope: :interval_month 

	has_many :customers
end
