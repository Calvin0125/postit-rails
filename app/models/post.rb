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

  def total_votes
    self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end
end