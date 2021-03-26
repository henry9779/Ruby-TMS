class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :state
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
