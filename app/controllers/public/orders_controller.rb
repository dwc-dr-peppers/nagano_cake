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
    end
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.payment_way = params[:order][:payment_method]
    @order.customer_id = current_customer.id
    @order.save
    if params[:order][:address_select] == "3"
      shipping_address = ShippingAddress.new
      shipping_address.postcode = @order.postcode
      shipping_address.address = @order.address
      shipping_address.name = @order.shipping_name
      shipping_address.customer_id = current_customer.id
      shipping_address.save
    end
    cart_items.each do |cart|
      order_details = OrderDetail.new
      order_details.item_id = cart.item_id
      order_details.purchase_price = cart.item.price
      order_details.quantitiy = cart.quantitiy
      order_details.order_id = @order.id
      order_details.save
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
  end

  def show
    @order = Order.find(params[:id])
    @total = 
    @totalamount = 0
  end

  def index
    @orders = current_customer.orders.all
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_name, :address, :postcode, :postage, :total_amount)
  end

end
