class PostRecipesController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
   before_action :set_article, only: [:show, :edit, :update, :destroy]


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
    @post_comment = PostComment.new
  end

  def new
    @post_recipe = PostRecipe.new
    ##親モデル.子モデル.buildで子モデルのインスタンス作成
    @recipe_infos = @post_recipe.recipe_infos.build
    @how_to_makes = @post_recipe.how_to_makes.build
    @genres = Genre.all
  end

  def edit
    @genres = Genre.all
    if @post_recipe.user == current_user
      render "edit"
    else
      redirect_to post_recipe_path(@post_recipe)
    end
  end

  def update
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
    if @post_recipe.user == current_user
      @post_recipe.destroy
      redirect_to post_recipes_path
    else
      render "show"
    end
  end

  def search
    @post_recipes = PostRecipe.search(params[:keyword]).page(params[:page]).reverse_order
    @keyword = params[:keyword]
    render "index"
  end

  def set_article
    @post_recipe = PostRecipe.find(params[:id])
  end

  private

  def post_recipe_params
    params.require(:post_recipe).permit(:title, :image, :genre_id, :cook_time, :ingredient, :post_introduction,
    recipe_infos_attributes:[:ing_name, :quantity, :_destroy], how_to_makes_attributes:[:explanation, :process_image, :order_no, :_destroy])
  end

end