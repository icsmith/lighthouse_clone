class FormsController < ApplicationController
	before_action :authenticate_admin!
	
	def service_check_list
		@customer = Customer.find(params[:id])
	end

	def show
	end

	def generate_bills
		@bills = flash[:data]
	end
end
