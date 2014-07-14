class AddUserIdColumnToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :user_id, :integer
  end
end
