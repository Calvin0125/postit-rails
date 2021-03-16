class Post < ActiveRecord::Base
  include Voteable

  belongs_to :user, foreign_key: :user_id
  has_many :comments, foreign_key: :post_id
  has_many :posts_categories, class_name: "PostCategory"
  has_many :categories, through: :posts_categories

  validates :title, presence: true
  validates :url, presence: true
  validates :description, presence: true

  before_save :generate_slug

  def generate_slug
    self.slug = self.title.parameterize
  end

  def to_param
    self.slug
  end

  def belongs_to_user(user_id)
    self.user_id == user_id
  end
end