class AddRepoIdColumnToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :repo_id, :integer
  end
end
