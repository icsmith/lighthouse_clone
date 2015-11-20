class TransmitterTypesController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_transmitter_type, only: [:show, :edit, :update, :destroy]

	def lookup_transmitter_type
		@trans_t = TransmitterType.find(params[:id])
	end

	def index
		@trans_t = TransmitterType.all
	end

	def show

	end

	def new
		@trans_t = TransmitterType.new
	end

	def create
		@trans_t = TransmitterType.new(transmitter_type_params)
		if @trans_t.save
			flash[:notice] = "Transmitter Type Created"
			redirect_to transmitter_types_path
		else
			flash[:notice] = @trans_t.errors.messages
			redirect_to new_transmitter_type_path
		end
	end

	def edit

	end

	def update
		@trans_t.update(transmitter_type_params)
		flash[:notice] = @trans_t.errors.messages.first || "Transmitter updated"
		redirect_to transmitter_type_path(@trans_t)
	end

	def destroy
		@trans_t.destroy
		flash[:notice] = "Transmitter destroyed"
		redirect_to transmitter_types_path
	end

	def transmitter_type_params
		params.require(:transmitter_type).permit(:transmitter_type)
	end

end
