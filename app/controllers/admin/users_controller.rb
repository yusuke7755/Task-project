class Admin::UsersController < ApplicationController
  before_action :set_user, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  #skip_before_action :validate_last_admin , only: [:update, :destroy]
 
  def index
    @users = User.all.includes(:tasks)  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path,notice: "ユーザーを新しく登録しました。"
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー情報を変更しました。"
    else
      render :edit
    end

  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザーを削除しました。"
    else
      redirect_to admin_users_path #, notice: "最低1ユーザーは管理者権限を持つ必要があります。"
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :name,:email,:password, :password_confirmation,:admin)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
