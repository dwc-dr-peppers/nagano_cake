class Public::ShippingAddressesController < ApplicationController

  def index
    @customer = current_customer
    #@shipping_addresses = ShippingAddress.all(@customer)
  end

  def edit
  end

  def create
    shippingaddress.save
    redirect_to "index"
  end

  def update
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
