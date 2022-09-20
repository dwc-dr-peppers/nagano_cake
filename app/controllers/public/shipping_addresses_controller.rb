class Public::ShippingAddressesController < ApplicationController

  def index
    @customer = current_customer
    @shipping_addresses = ShippingAddress.all#(@customer)
  end

  def edit
    @shippingaddress = ShippingAddress.find(params[:id])
  end

  def create
    @shippingaddress = ShippingAddress.new(shippingaddress_params)
    @shippingaddress.save
    redirect_to "index"
  end

  def update
    @shippingaddress = ShippingAddress
  end

  def destroy
    @shippingaddress = ShippingAddress.find(params[:id])
    @shippingaddress.destroy
    redirect_to "index"
  end

  private

  def shippingaddress_params
    params.require(:shippingaddress).permit(:postcode, :address, :name)
  end

end
