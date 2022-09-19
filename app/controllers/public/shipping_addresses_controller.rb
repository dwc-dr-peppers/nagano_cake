class Public::ShippingAddressesController < ApplicationController

  def index
    @shippingaddress = current_customer.address
  end

  def edit
  end

  def create
    @shippingaddress = ShippingAddresses.new
    @shippingaddress.save
    redirect_to "index"
  end

  def update
  end

  def destroy
    @shippingaddress = ShippingAddresses.find(params[:id])
  end
  
  private
  
  def shippingaddress_params
    params.require(:shippingaddress)

end
