class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def index
    @genres = Genre.all
    @items = params[:name].present? ? Genre.find(params[:name]).items : Item.page(params[:page]).per(6)

    if params[:name]
      @item_count = Genre.find(params[:name]).items.count
      @items = Genre.find(params[:name]).items.page(params[:page]).per(6)
      @index_name = Genre.find(params[:name]).name

    else
      @item_count = Item.count
      @items = Item.page(params[:page]).per(6)
      @index_name = "商品"

    end

  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id)
  end

end
