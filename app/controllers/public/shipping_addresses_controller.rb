class Public::ShippingAddressesController < ApplicationController

  def index
    @shipping_addresses = current_customer.shipping_addresses.all
    #@shipping_addresses = ShippingAddress.all(params[:customer_id])
  end

  def edit
    @shippingaddress = ShippingAddress.find(params[:id])
  end

  def create
    shippingaddress = ShippingAddress.new(shippingaddress_params)
    shippingaddress.save
    redirect_to shipping_addresses_path
  end

  def update
    shippingaddress = ShippingAddress.find(params[:id])
    shippingaddress.update(shippingaddress_params)
    redirect_to shipping_addresses_path
  end

  def destroy
    @shippingaddress = ShippingAddress.find(params[:id])
    @shippingaddress.destroy
    redirect_to "index"
  end

  private

  def shippingaddress_params
    params.require(:shipping_address).permit(:postcode, :address, :name, :customer_id)
  end

end
