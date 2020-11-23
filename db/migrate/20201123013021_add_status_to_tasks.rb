class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    # tasksテーブルに新規カラムとしてstatusカラムをstringのデータ型で追加
    add_column :tasks, :status, :string
  end
end
