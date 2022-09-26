class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total_amount = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_item = current_customer.cart_items
    cart_item.destroy_all
    redirect_to cart_items_path
  end

  def create
    cart_item = CartItem.find_by(item_id: cart_item_params[:item_id], customer_id: current_customer.id)
      if cart_item.present?
        #カートに同商品があった場合は数量を追加
        cart_item.quantitiy += cart_item_params[:quantitiy].to_i
        if cart_item.save #10個までなら保存できる
          redirect_to cart_items_path
        else #11個以上はカートに追加できない
          redirect_to item_path(cart_item.item), alert: '1回の注文では同商品は合計で10個までしか注文できません'
        end
      else
        #なかったらレコードを追加
        cart_item = CartItem.new(cart_item_params)
        #cart_item.customer_id = current_customer.id
        cart_item.save
        redirect_to cart_items_path
      end
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantitiy, :customer_id)
  end



end
