class ChangeColumnTasks < ActiveRecord::Migration[6.0]
  def up
    change_column :tasks, :name, :string, null: false, limit: 20
    change_column :tasks, :content, :text, null: false
  end

  def down
    change_column :tasks, :name, :string 
    change_column :tasks, :content, :text
  end
end
