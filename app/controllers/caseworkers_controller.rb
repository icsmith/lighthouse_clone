class CaseworkersController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_caseworker, only: [:show, :destroy, :edit, :update]

	def lookup_caseworker
		@caseworker = Caseworker.find(params[:id])
	end

	def index
		@q = Caseworker.ransack(params[:q])
  		@caseworkers = @q.result(distinct: true)

	end

	def show

	end

	def new
		@caseworker = Caseworker.new
	end

	def create
		@caseworker = Caseworker.new(caseworker_params)

		if @caseworker.save
			flash[:notice] = "Caseworker created"
			redirect_to caseworkers_path
			
		else
			flash[:notice] = @caseworker.errors.messages.to_s.humanize
			render 'new'
		end
	end

	def edit

	end

	def update

		if @caseworker.errors.messages.count > 0
			flash[:notice] = "Error "<< @caseworker.errors.messages.to_s.humanize
			redirect_to caseworker_path
		else
			flash[:notice] = "caseworker updated"
			@caseworker.update(caseworker_params)
			redirect_to caseworker_path
		end

	end

	def destroy
		flash[:notice] = 'Destroyed '<<@caseworker.name
		@caseworker.destroy
		redirect_to caseworkers_path
	end

	def caseworker_params
		params.require(:caseworker).permit(:name, :phone, :fax, :customer_id)
	end

end
