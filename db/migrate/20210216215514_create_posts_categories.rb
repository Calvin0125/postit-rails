class CreatePostsCategories < ActiveRecord::Migration
  def change
    create_table :posts_categories do |t|
      t.integer :post_id, :category_id, null: false
      t.timestamps
    end
  end
end
