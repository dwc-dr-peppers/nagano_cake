class Public::HomesController < ApplicationController


  def top
    @recomend_items = items.limit(4).order(updated_at: "DESC")
  end

  def about
  end

end
