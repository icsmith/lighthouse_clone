class FormsController < ApplicationController
	
	def service_check_list
		@customer = Customer.find(params[:id])
	end

	def show
	end
end
