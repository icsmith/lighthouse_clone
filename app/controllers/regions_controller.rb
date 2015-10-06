class RegionsController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_region, only:[:show, :edit, :update, :destroy]


	def lookup_region
		@region = Region.find(params[:id])
	end

	def index

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
