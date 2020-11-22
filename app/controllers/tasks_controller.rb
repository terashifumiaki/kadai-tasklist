class TasksController < ApplicationController
  
  # コントローラー内のルーティングと同じ名前のメソッドとして定義する。
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

# セキュリティ関係から、ストロングパラメーターとかいうものを使用。
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスクが投稿されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクが投稿されませんでした"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "Taskは正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = "Taskは更新されませんでした"
      render :edit
    end
    
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "Taskは正常に削除されました"
    redirect_to tasks_url
  end
  
end

private

def task_params
  params.require(:task).permit(:content)
end