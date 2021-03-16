class Category < ActiveRecord::Base
  has_many :posts_categories, class_name: "PostCategory"
  has_many :posts, through: :posts_categories

  validates :name, presence: true

  before_save :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end
  
  def to_param
    self.slug
  end
end