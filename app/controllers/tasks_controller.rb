class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :show, :update, :destroy]
  # before_action :set_task, only: [:show, :edit, :update, :destroy]
  # コントローラー内のルーティングと同じ名前のメソッドとして定義する。
  
  def index
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
      # @tasks = Task.all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

# セキュリティ関係から、ストロングパラメーターとかいうものを使用。
  def create
    @task = current_user.tasks.build(task_params)
    # @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクが投稿されました"
      redirect_to @task
    else
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = "タスクが投稿されませんでした"
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "Taskは正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = "Taskは更新されませんでした"
      render :edit
    end
    
  end

  def destroy
    @task.destroy
    
    flash[:success] = "Taskは正常に削除されました"
    redirect_to tasks_url
  end
  


private

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end


def task_params
  params.require(:task).permit(:content, :status)
end

end