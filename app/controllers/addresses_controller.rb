class AddressesController < ApplicationController
	before_action :authenticate_admin!
	before_action :grab_customer, only: [:new, :create]

	def grab_customer
		@customer = Customer.find(params[:customer_id])
	end

	def index
		#unused
	end

	def show
		#unused
	end

	def new
		@address = @customer.addresses.build
	end

	def create
		@address = Address.new(address_params)
		@address.customer_id = @customer.id
		@address.save

		if @address.errors.messages.count > 0
			flash[:notice] = @address.errors.messages.to_s.humanize
			redirect_to new_customer_address_path(@customer)
		else
			flash[:notice] = "Address created"
			redirect_to customer_path(@customer)
		end
	end

	def edit
		
	end

	def update

	end

	def destroy
		flash[:notice] = "Address destroyed"
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to(:back)
	end

	def address_params
		params.require(:address).permit(:address_1, :address_2, :city, :state, :id, :zip, :phone, :is_billing_address)

	end

end
