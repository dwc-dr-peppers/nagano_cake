class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    if params[:name]
      @item_count = Genre.find(params[:name]).items.count
    else
      @item_count = Item.count
    end

    @items = Item.all
    @genres = Genre.all
    @items = params[:name].present? ? Genre.find(params[:name]).items : Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id)
  end

end
