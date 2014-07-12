class CreateResourceItems < ActiveRecord::Migration
  def change
    create_table :resource_items do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
