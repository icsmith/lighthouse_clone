class SystemTypesController < ApplicationController
	before_action :authenticate_admin!
	before_action :lookup_system_type, only: [:show, :edit, :update, :destroy]

	def lookup_system_type
		@sys_t = SystemType.find(params[:id])
	end

	def index
		@sys_t = SystemType.all
	end

	def show

	end

	def new
		@sys_t = SystemType.new
	end

	def create
		@sys_t = SystemType.new(system_type_params)
		if @sys_t.save
			flash[:notice] = "System Type Created"
			redirect_to system_types_path
		else
			flash[:notice] = @sys_t.errors.messages
			redirect_to new_system_type_path
		end
	end

	def edit

	end

	def update
		@sys_t.update(system_type_params)
		flash[:notice] = @sys_t.errors.messages.first || "System updated"
		redirect_to system_type_path(@sys_t)
	end

	def destroy
		@sys_t.destroy
		flash[:notice] = "System destroyed"
		redirect_to system_types_path
	end

	def system_type_params
		params.require(:system_type).permit(:system_type)
	end

end
