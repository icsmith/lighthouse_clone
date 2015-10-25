class RegionsController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_region, only:[:show, :edit, :update, :destroy]


	def lookup_region
		@region = Region.find(params[:id])
	end

	def index
		@regions = Region.all
	end

	def show

	end

	def new
		@region = Region.new
	end

	def create
		@region = Region.new(region_params)
		if @region.save
			flash[:notice] = "Region created"
			redirect_to regions_path
		else
			flash[:notice] = @region.errors.messages
			redirect_to new_region_path
		end
	end

	def edit

	end

	def update
		@region.update(region_params)
		if @region.save
			flash[:notice] = "Region updated"
			redirect_to regions_path
		else
			flash[:notice] = @region.errors.messages
			redirect_to edit_region_path(@region)
		end
	end

	def destroy
		@region.destroy
		flash[:notice] = "Region destroyed"
		redirect_to regions_path
	end

	def region_params
		params.require(:region).permit(:region_name)
	end

end
