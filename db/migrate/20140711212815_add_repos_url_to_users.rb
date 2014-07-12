class AddReposUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :repos_url, :string
  end
end
