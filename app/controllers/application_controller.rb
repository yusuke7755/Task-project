class ApplicationController < ActionController::Base
  # 日本語化処理
  before_filter :set_charset
 
  private
  def set_charset
    headers["Content-Type"] = "text/html; charset=UTF-8"
  end
end
