class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :commiter_name
      t.string :message
      t.datetime :date
      t.string :sha
      t.string :url
      t.string :avatar_url

      t.timestamps
    end
  end
end
