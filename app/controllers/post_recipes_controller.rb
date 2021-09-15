class PostRecipesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_recipe = PostRecipe.new(post_recipe_params)
    @post_recipe.user = current_user
    if @post_recipe.save
      flash[:notice] = "投稿しました。"
      redirect_to post_recipes_path
    else
      @user = current_user
      @genres = Genre.all
      render "new"
    end
  end

  def index
    @post_recipes = PostRecipe.all
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
  end

  def new
    @post_recipe = PostRecipe.new
    @genres = Genre.all
  end


  def edit
  end

  private

  def post_recipe_params
    params.require(:post_recipe).permit(:title, :image, :genre_id, :ingredient, :post_introduction)
  end

end
