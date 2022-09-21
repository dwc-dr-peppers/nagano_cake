class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total_amount = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def create
    cart_item = CartItem.find_by(item_id: cart_item_params[:item_id])
      if cart_item.present?
        #カートに同商品があった場合は数量を追加
        cart_item.quantitiy += cart_item_params[:quantitiy].to_i
        cart_item.save
        redirect_to cart_items_path
      else
        #なかったらレコードを追加
        cart_item = CartItem.new(cart_item_params)
        cart_item.save
        redirect_to cart_items_path
      end
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantitiy, :customer_id)
  end



end
