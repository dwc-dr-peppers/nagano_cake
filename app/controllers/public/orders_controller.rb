class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @shipping_addresses = current_customer.shipping_addresses
  end

  def confirm
    #@total_amount = "0"
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:address_select] == "1"
      @order.shipping_name = current_customer.family_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postcode = current_customer.postcode
    elsif params[:order][:address_select] == "2"
      @order = Order.new(order_params)
      @address = current_customer.shipping_addresses.find_by(id: params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.shipping_name = @address.name
    elsif params[:order][:address_select] == "3"
      shipping_address = ShippingAddress.new
      shipping_address.postcode = @order.postcode
      shipping_address.address = @order.address
      shipping_address.name = @order.shipping_name
      shipping_address.customer_id = current_customer.id
      shipping_address.save
    end
    @total_amount = @order.total_amount
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.order.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_details = OrderDetails.new
        order_details.item_id = cart_items.item_id
        order_details.order_id = @order.id
        order_details.quantity = cart.quantity
        order_details.purchase_price = cart_items.item.price
        order_details.save
      end
      redirect_to orders_conplete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_name, :address, :postcode, :total_amount)
  end

end
