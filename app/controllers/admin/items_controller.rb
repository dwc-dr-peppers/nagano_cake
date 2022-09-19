class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index

  end

  def show

  end

  def edit

  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
    #リダイレクト先は後で修正します
  end

  def update

  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :is_sale, :name, :introduction, :price, :image)
  end




end
