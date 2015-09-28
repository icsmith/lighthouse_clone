class CustomersController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_customer, only: [:show, :destroy, :service_check_list, :edit, :update]
	def lookup_customer
		@customer = Customer.find(params[:id])
	end


	def index
		@customers = Customer.all
		if params[:search]
		    @customers = Customer.search(params[:search]).order("created_at DESC")
		else
		    @customers = Customer.all.order('created_at DESC')
		end
	end

	def show
		
	end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.create(customer_params)
		if @customer.errors.messages.count > 0
			flash[:notice] = @customer.errors.messages.to_s.humanize
			redirect_to new_customer_path
		else
			flash[:notice] = "Customer created"
			redirect_to customers_path
		end
	end


	def edit

	end

	def update
	
		if @customer.errors.messages.count > 0
			flash[:notice] = "Error "<< @customer.errors.messages.to_s.humanize
			redirect_to customer_path
		else
			flash[:notice] = "Customer updated"
			@customer.update(customer_params)
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
	  params.require(:customer).permit(:first_name, :last_name, :dob, :sex, :middle_initial, :language, :memo, :status, :status_note, :client_central_station_account_number, :install_date, :cancel_date, :initial_contact_autorization_date)
	end
end
