class TransponderTypesController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_transponder_type, only: [:show, :edit, :update, :destroy]

	def lookup_transponder_type
		@trans_t = TransponderType.find(params[:id])
	end

	def index
		@trans_t = TransponderType.all
	end

	def show

	end

	def new
		@trans_t = TransponderType.new
	end

	def create
		@trans_t = TransponderType.new(transponder_type_params)
		if @trans_t.save
			flash[:notice] = "Transponder Type Created"
			redirect_to transponder_types_path
		else
			flash[:notice] = @trans_t.errors.messages
			redirect_to new_transponder_type_path
		end
	end

	def edit

	end

	def update
		@trans_t.update(transponder_type_params)
		flash[:notice] = @trans_t.errors.messages.first || "Transponder updated"
		redirect_to transponder_type_path(@trans_t)
	end

	def destroy
		@trans_t.destroy
		flash[:notice] = "Transponder destroyed"
		redirect_to transponder_types_path
	end

	def transponder_type_params
		params.require(:transponder_type).permit(:transponder_type)
	end

end
