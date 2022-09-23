class Public::HomesController < ApplicationController


  def top
   @genres = Genres.all
   @items = Item.order('id DESC').limit(4)
  end


  def about
  end

end
