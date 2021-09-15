class Admin::PostRecipesController < ApplicationController


  def index
    @post_recipes = PostRecipe.all
  end

  def show
  end

  def edit
  end
end
