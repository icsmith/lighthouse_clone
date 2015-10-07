class BillingIntervalsController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_billing, only:[:show, :edit, :update, :destroy]

	def lookup_billing
		@billing = BillingInterval.includes(:customers).find(params[:id])
	end

	def index
		@billings = BillingInterval.all
	end

	def show

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

	def select_billings
		target = params[:target][:target].to_i
		@adjust = (target % 4)
		@adjust = 4 if @adjust == 0
		@billings_array = []
		@billings_array << BillingInterval.find_by(billing_interval_name: "Monthly")
	
		b = BillingInterval.find_by(billing_interval_name: "Quarterly", interval_month: @adjust)
		@billings_array << b


		@billings_array <<  BillingInterval.find_by(billing_interval_name: "Yearly", interval_month: target)
		
		flash[:data] = @billings_array
		redirect_to forms_path+"/generate_bills"
	end

end
