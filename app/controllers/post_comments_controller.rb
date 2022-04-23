class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post_recipe = PostRecipe.find(params[:post_recipe_id])
    comment = current_user.post_comment.new(post_comment_params)
    comment.post_recipe_id =post_recipe.id
    comment.save
    redirect_to post_recipe_path(post_recipe)
  end

  def destroy
    PostComment.find_by(id: params[:id], post_recipe_id: params[:post_recipe_id]).destroy
    redirect_to post_recipe_path(params[:post_recipe_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
