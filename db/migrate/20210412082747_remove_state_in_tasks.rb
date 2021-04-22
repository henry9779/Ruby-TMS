class RemoveStateInTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :state
  end
end
