class BillingIntervalsController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_billing, only:[:show, :edit, :update, :destroy]

	def lookup_billing
		@billing = BillingInterval.find(params[:id])
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

end
