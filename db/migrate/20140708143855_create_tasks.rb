class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
    add_index :tasks, :user_id
    #Add_index by user_id allows us to search by user_id
    #add_index allows us to do "current_user.tasks" quickly
  end
end
