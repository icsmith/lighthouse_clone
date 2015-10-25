class SystemsController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_customer

	def lookup_customer
		@customer = Customer.find(params[:customer_id])
	end

	def index

	end

	def show

	end

	def new
		@system = @customer.build_system
	end

	def create
		@system = System.new(system_params)
		@system.customer_id = @customer.id 
		if @system.save
			flash[:notice] = "System created"
			redirect_to customer_path(@customer)
		else
			flash[:notice] = @system.errors.messages.to_s.humanize
			redirect_to new_customer_system_path(@customer)
		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

end
