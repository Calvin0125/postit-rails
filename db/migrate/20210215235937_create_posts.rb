class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url, :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
