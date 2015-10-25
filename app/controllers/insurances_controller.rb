class InsurancesController < ApplicationController
	before_action :authenticate_admin!
	before_action :grab_customer, only: [:new, :create, :edit, :update, :show, :destroy]



	def grab_customer
		@customer = Customer.find(params[:customer_id])
	end

	def index

	end

	def show
		@insurance = @customer.insurance
	end

	def new
		@insurance = @customer.build_insurance

	end

	def create

		@insurance = Insurance.new(insurance_params)
		@insurance.customer_id = @customer.id
		@insurance.save

		if @insurance.errors.messages.count > 0
			flash[:notice] = @insurance.errors.messages.to_s.humanize
			redirect_to new_customer_insurance_path(@customer)
		else
			flash[:notice] = "Insurance created"
			redirect_to customer_path(@customer)
		end

	end

	def edit
		@insurance = @customer.insurance
	end

	def update
		@insurance = @customer.insurance

		if @insurance.errors.messages.count > 0
			flash[:notice] = "Error "<< @insurance.errors.messages.to_s.humanize
			redirect_to customer_insurance_path(@customer.id, @customer.insurance.id)
		else
			flash[:notice] = "insurance updated"
			@insurance.update(insurance_params)
			redirect_to customer_insurance_path(@customer.id, @customer.insurance.id)
		end

	end

	def destroy
		@customer.insurance.destroy
		flash[:notice] = "Insurance destroyed"
		redirect_to customer_path(@customer)
	end

	def insurance_params
		params.require(:insurance).permit(:insurance_name, :diagnostics_code, :venue, :medicaid_number, :isp_end_date, :customer_id)

	end

end
