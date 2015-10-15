class CustomerImportsController < ApplicationController
  def new
    @customer_import = CustomerImport.new
  end

  def create
    @customer_import = CustomerImport.new(params[:customer_import])
    if @customer_import.save
      redirect_to root_url, notice: "Imported customers successfully."
    else
      render :new
    end
  end
end