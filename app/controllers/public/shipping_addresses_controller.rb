class Public::ShippingAddressesController < ApplicationController

  def index
    @shipping_addresses = current_customer.shipping_addresses.all
  end

  def edit
    @shippingaddress = ShippingAddress.find(params[:id])
  end

  def create
    shippingaddress = ShippingAddress.new(shippingaddress_params)
    if shippingaddress.save
      redirect_to shipping_addresses_path
    else
      @shipping_addresses = current_customer.shipping_addresses.all
      render :index
    end
  end

  def update
    shippingaddress = ShippingAddress.find(params[:id])
    if shippingaddress.update(shippingaddress_params)
      redirect_to shipping_addresses_path
    else
      @shippingaddress = ShippingAddress.find(params[:id])
      render :edit
    end
  end

  def destroy
    @shippingaddress = ShippingAddress.find(params[:id])
    @shippingaddress.destroy
    redirect_to shipping_addresses_path
  end

  private

  def shippingaddress_params
    params.require(:shipping_address).permit(:postcode, :address, :name, :customer_id)
  end

end
