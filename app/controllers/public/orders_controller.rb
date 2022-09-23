class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @shipping_addresses = current_customer.shipping_addresses
  end

  def confirm
    @order = Order.new(order_params)
    @total = 0
    @postage = 800
    @totalamount = 0
    @cart_items = current_customer.cart_items.all
    @totalamount = @order.total_amount
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.order.new(order_params)
    @postage = 800
    @order.postage = @postage
    @order.payment_way = params[:order][:payment_method]
    if params[:order][:address_select] == "1"
      @order.shipping_name = current_customer.family_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postcode = current_customer.postcode
    elsif params[:order][:address_select] == "2"
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
    @order.save
    cart_items.each do |cart|
      order_details = OrderDetails.new
      order_details.item_id = cart.item_id
      order_details.order_id = @order.id
      order_details.quantity = cart.quantity
      order_details.purchase_price = cart.item.price
    end
    order_details.save
    redirect_to orders_conplete_path
    cart_items.destroy_all
  end

  def show
  end

  def index
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_name, :address, :postcode, :total_amount)
  end

end
