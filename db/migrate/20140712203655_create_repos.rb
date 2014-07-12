class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.datetime :birthday
      t.string :commits_url
      t.text :description

      t.timestamps
    end
  end
end
