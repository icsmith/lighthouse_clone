class FormsController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_customer, only:[:service_check_list, :account_shell]
	def service_check_list
	end

	def show
	end

	def generate_bills
		@bills = flash[:data]
	end

	def account_shell
	end

	def lookup_customer
		@customer = Customer.find(params[:id])

	end
end
