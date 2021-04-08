class RemoveColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :end_time
    remove_column :tasks, :start_time
  end
end
