class AddTaskIdToTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :tags, :task_id, foreign_key: true
  end
end
