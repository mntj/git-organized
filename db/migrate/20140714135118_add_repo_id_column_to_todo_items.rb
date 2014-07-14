class AddRepoIdColumnToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :repo_id, :integer
  end
end
