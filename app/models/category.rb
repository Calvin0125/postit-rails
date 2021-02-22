class Category < ActiveRecord::Base
  has_many :posts_categories, class_name: "PostCategory"
  has_many :posts, through: :posts_categories

  validates :name, presence: true
end