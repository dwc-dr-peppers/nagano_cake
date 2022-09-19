class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

end
