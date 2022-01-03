class Admin::PostRecipesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @post_recipes = PostRecipe.all
  end

  def show
  end

  def edit
    @genres = Genre.all
  end

  def update
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
    @post_recipe.destroy
    redirect_to admin_post_recipes_path
  end

  def retrieval
    @post_recipes = PostRecipe.retrieval(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def set_article
    @post_recipe = PostRecipe.find(params[:id])
  end

  private

  def post_recipe_params
    params.require(:post_recipe).permit(:title, :image, :genre_id, :cook_time, :ingredient, :post_introduction)
  end

end
