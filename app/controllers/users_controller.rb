class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy, :favorite_lists]

  def show
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
      if @user.update(user_params)
        flash[:notice] = "登録情報を変更しました。"
        redirect_to user_path(@user)
      else
       render "edit"
      end
  end

  def favorite_lists
    @post_recipes = @user.post_recipes.all
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

  def set_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :account_image, :email)
  end

end
