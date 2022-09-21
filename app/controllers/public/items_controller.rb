class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
