class HomesController < ApplicationController
  def top
    @post_recipes =PostRecipe.all
    
  end

  def about
  end
end
