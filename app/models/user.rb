class User < ActiveRecord::Base
  has_many :posts, foreign_key: :user_id
  has_many :comments, foreign_key: :user_id
  has_many :votes

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 5 }, on: :create

  before_save :generate_slug

  def generate_slug
    self.slug = self.username.parameterize
  end

  def to_param
    self.slug
  end
end