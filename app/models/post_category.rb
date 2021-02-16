class PostCategory < ActiveRecord::Base
  self.table_name = "posts_categories"
  belongs_to :post
  belongs_to :category
end