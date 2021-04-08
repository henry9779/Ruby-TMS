class AddEndAtToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :end_at, :datetime
  end
end
