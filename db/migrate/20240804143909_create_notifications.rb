class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :task_id
      t.integer :user_id
      t.text :details

      t.timestamps
    end
  end
end
