class Category < ActiveRecord::Base
  include Sluggable

  has_many :posts_categories, class_name: "PostCategory"
  has_many :posts, through: :posts_categories

  validates :name, presence: true
end