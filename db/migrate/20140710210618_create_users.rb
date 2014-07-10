class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.text :oauth_token
      t.datetime :oauth_expires_at
      t.string :github_email
      t.string :github_profile_img

      t.timestamps
    end
  end
end
