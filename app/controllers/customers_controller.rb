class CustomersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def new

	end

	def create

	end

	def edit

	end

	def update

	end

	def destroy

	end

	def service_check_list
		@customer = Customer.find(params[:id])
	end

end
