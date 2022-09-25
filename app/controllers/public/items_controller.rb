class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    if params[:name]
      @item_count = Genre.find(params[:name]).items.count
    elsif params[:page]
      @item_count = Item.page(params[:page]).count
    else
      @item_count = Item.count

    end

    #@items_all = Item.all
    @genres = Genre.all
    @items = params[:name].present? ? Genre.find(params[:name]).items : Item.all
    @items_page = Item.page(params[:page]).per(6)

  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id)
  end

end
