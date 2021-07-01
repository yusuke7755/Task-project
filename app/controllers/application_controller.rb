class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper


  private

  def authenticate_user
    unless logged_in?
      flash[:danger] = 'ログインが必要です。'
      redirect_to new_session_path
    end
  end

  def ensure_current_user_task_check
    unless current_user.id == @task.user_id
      flash[:danger] = 'タスク一覧に戻ります'
      redirect_to tasks_path
    end
  end

  def ensure_current_user
    if logged_in?
      unless current_user.id == params[:id].to_i
        flash[:danger] = '管理者以外はアクセスできない'
        redirect_to tasks_path
      end
    else
      flash[:danger] = 'アクセス権限がありません。ログイン画面に遷移します。'
      redirect_to new_session_path
    end
  end

  def ensure_admin_user
    if logged_in?
      unless current_user.admin?
        redirect_to tasks_path
        flash[:danger] = 'このユーザーにはアクセス権限がありません。'
      end
    else
      flash[:danger] = 'ログインが必要です。'
      redirect_to new_session_path
    end
  end

end
