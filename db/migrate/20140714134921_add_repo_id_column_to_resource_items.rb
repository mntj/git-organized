class AddRepoIdColumnToResourceItems < ActiveRecord::Migration
  def change
    add_column :resource_items, :repo_id, :integer
  end
end
