class CustomersController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_customer, only: [:show, :destroy, :service_check_list, :edit, :update, :select]
	def lookup_customer
		@customer = Customer.find(params[:id])
	end


	def index
		@q = Customer.includes(:addresses, :system, :caseworker, :region, :billing_interval).ransack(params[:q])
  		@customers = @q.result(distinct: true)
	end

	def show
		
	end

	def new
		@customer = Customer.new
		@customer.addresses.build
		@customer.build_system
	end

	def create
		@customer = Customer.new(customer_params)

		if @customer.save
			flash[:notice] = "Customer created"
			redirect_to customers_path
			
		else
			flash[:notice] = @customer.errors.messages.to_s.humanize
			render 'new'
		end
	end

	def select

	end

	def edit
		unless @customer.system
			@customer.build_system
		end
	end

	def update
	
		if @customer.update(customer_params)
			flash[:notice] = "Customer updated"
			redirect_to customer_path
		else
			flash[:notice] = "Error "<< @customer.errors.messages.to_s.humanize
			redirect_to customer_path
		end
	end

	def destroy
		@customer.destroy
		flash[:notice] = 'Destroyed '<<@customer.first_name
		redirect_to customers_path
	end

	def service_check_list
	end




	private

	def customer_params
	  params.require(:customer).permit(:first_name, :last_name, :dob, :sex, 
	  	:middle_initial, :language, :memo, :status, :status_note, 
	  	:client_central_station_account_number, :install_date, :cancel_date, 
	  	:initial_contact_authorization_date,
	  	:caseworker_id, :region_id, :billing_interval_id,
	  	addresses_attributes:[:address_1, :address_2, :city, :state, :id, :zip, :phone, :phone_2, :is_billing_address, :customer],
	  	system_attributes:[:lock_number, :test_call_number, :battery_date, :transmitter_date, :system_type_id, :transmitter_type_id, :id])

	end



end
