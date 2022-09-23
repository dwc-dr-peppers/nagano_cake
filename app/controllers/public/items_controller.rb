class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @item_count = Item.count
    @items = Item.all
    @genres = Genre.all
    @items = params[:name].present? ? Genre.find(params[:name]).items : Item.all
  end

end
