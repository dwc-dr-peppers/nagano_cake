class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @item_count = Item.count
    @items = Item.all
  end

end
