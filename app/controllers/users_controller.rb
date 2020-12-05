class UsersController < ApplicationController

  # ユーザ登録用のフォーム設置部分↓コントローラと、もう一つはview
  def new
    @user = User.new
  end

  def create
  end
end
