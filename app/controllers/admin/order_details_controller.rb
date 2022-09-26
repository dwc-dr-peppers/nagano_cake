class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!

	def update
		order_detail = OrderDetail.find(params[:id])
		order = order_detail.order
		# order_details = OrderDetail.where(order_id: [order.id])
		order_detail.update(order_detail_params)
		# ②製作ステータスが一つでも 製作中 → 注文ステータスを 製作中
		if order_detail.make_status == "in_production"
			order.update!(status: 2)
	  end

		# ③製作ステータスが全て 製作完了 → 注文ステータスを 発送準備中
		if order.order_details.count == order.order_details.where(make_status: 3).count
			order.update!(status: 3)
	  end

		redirect_to admin_order_path(order)
	end

	private
		def order_detail_params
			params.require(:order_detail).permit(:make_status)
		end


end
