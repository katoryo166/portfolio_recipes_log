class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def upadate
    if user.update(user_params)
      flash[:notice] = "登録情報を変更しました。"
      redirect_to user_path(user)
    else
      render :edit and return
    end
  end

  def favorite_list
  end

  def unsubscribe
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
