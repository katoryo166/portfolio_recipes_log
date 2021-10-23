class Admin::PostRecipesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_recipes = PostRecipe.all
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
    @genres = Genre.all
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    @genres = Genre.all
      if @post_recipe.update(post_recipe_params)
        flash[:notice] = "投稿を更新しました。"
        redirect_to admin_post_recipe_path(@post_recipe)
      else
        @genres = Genre.all
        render "edit"
      end
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:id])
    @post_recipe.destroy
    redirect_to admin_post_recipes_path
  end

  def post_recipe_params
    params.require(:post_recipe).permit(:title, :image, :genre_id, :ingredient, :post_introduction)
  end

end
