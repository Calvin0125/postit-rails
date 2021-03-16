module Sluggable
  extend ActiveSupport::Concern
  
  included do
    before_save :generate_slug
  end

  def generate_slug
    self.slug = self.title.parameterize
  end

  def to_param
    self.slug
  end
end