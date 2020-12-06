class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  # ユーザ登録用のフォーム設置部分↓コントローラと、もう一つはview
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

       if @user.save
         flash[:success] = 'ユーザを登録しました。'
         session[:user_id] = @user.id
         redirect_to login_url
       else
        flash.now[:danger] = 'ユーザの登録に失敗しました。'
        render :new
       end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
