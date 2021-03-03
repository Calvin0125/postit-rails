class Post < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  has_many :comments, foreign_key: :post_id
  has_many :posts_categories, class_name: "PostCategory"
  has_many :categories, through: :posts_categories
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :url, presence: true
  validates :description, presence: true

  def belongs_to_user(user_id)
    self.user_id == user_id
  end
end