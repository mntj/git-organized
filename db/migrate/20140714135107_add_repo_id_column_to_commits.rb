class AddRepoIdColumnToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :repo_id, :integer
  end
end
