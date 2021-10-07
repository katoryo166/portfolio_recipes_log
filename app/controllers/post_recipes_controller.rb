class PostRecipesController < ApplicationController
   before_action :authenticate_user!, only: [:new,:create]

  def create
    @post_recipe = PostRecipe.new(post_recipe_params)
    @post_recipe.user = current_user
    if @post_recipe.save
      flash[:notice] = "投稿しました。"
      redirect_to post_recipe_path(@post_recipe)
    else
      @user = current_user
      @genres = Genre.all
      render "new"
    end
  end

  def index
    @post_recipes = PostRecipe.page(params[:page]).reverse_order
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @post_recipe = PostRecipe.new
    @genres = Genre.all
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
    @genres = Genre.all
    if current_user == @post_recipe.user
      render "edit"
    else
      redirect_to post_recipe_path(@post_recipe)
    end
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    @genres = Genre.all
      if @post_recipe.update(post_recipe_params)
        flash[:notice] = "投稿を更新しました。"
        redirect_to post_recipe_path(@post_recipe)
      else
        @genres = Genre.all
        render "edit"
      end
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:id])
    @post_recipe.destroy
    redirect_to post_recipes_path
  end

  def search
    @post_recipes = PostRecipe.search(params[:keyword]).page(params[:page]).reverse_order
    @keyword = params[:keyword]
    render "index"
  end

  private

  def post_recipe_params
    params.require(:post_recipe).permit(:title, :image, :genre_id, :ingredient, :post_introduction)
  end

end
