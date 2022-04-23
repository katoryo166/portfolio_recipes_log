class HomesController < ApplicationController
  
  def top
    @post_recipes =PostRecipe.all.reverse_order
  end

  def about
  end
  
end
