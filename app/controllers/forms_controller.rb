class FormsController < ApplicationController
	layout false
	before_action :authenticate_admin!
	before_action :lookup_customer, only:[:service_check_list, :account_shell_spanish,:account_shell, :update_info]
	def service_check_list
	end

	def show
	end

	def generate_bills
		@bills = flash[:data]
	end

	def account_shell
	end

	def update_info
	end

	def account_shell
	end

	def lookup_customer
		@customer = Customer.find(params[:id])

	end
end
