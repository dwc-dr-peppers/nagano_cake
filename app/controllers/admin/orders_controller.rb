class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
  end


   def show
   	@order = Order.find(params[:id])
   	@order_items = OrderDetail.where(order_id:[@order.id])
   	@postage = 800
   	@order_detail = OrderDetail.find(params[:id])
   	@total_amount = 0
   end

   def update
   	@order = Order.find(params[:id])
      # @order_items = OrderDetail.where(order_id: @order.id)
      @order.update(order_params)
      # ①注文ステータスが 入金確認 → 全ての製作ステータスを 製作待ち
      if @order.status == "payment"
         @order.order_details.update(make_status: 1)
         # @order.order_details.each do |order_item|
         #    order_item.update!(make_status: 1)
         # end
      end
      redirect_to admin_order_path(@order)
   end

   private
   def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :payment_way, :status, :postage, :shipping_name, :total_amount)
   end


end
