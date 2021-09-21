class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:new,:create]


  def show
    @user = User.find(params[:id])
    @post_recipes = @user.post_recipes.all
  end

  def edit
    @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to user_path(current_user)
      end
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "登録情報を変更しました。"
        redirect_to user_path(@user)
      else
       render "edit"
      end
  end

  def favorite_lists
    @user = User.find(params[:id])
    favorite_lists = Favorite.where(user_id: @user.id)
    @like_post = PostRecipe.find(favorite_lists)
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :account_image)
  end

end
