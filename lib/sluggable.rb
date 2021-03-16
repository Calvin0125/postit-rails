module Sluggable
  extend ActiveSupport::Concern
  
  included do
    before_save :generate_slug
    class_attribute :slug_column
  end

  def generate_slug
    self.slug = self.send(self.slug_column).parameterize
  end

  def to_param
    self.slug
  end

  module ClassMethods
    def sluggable_column(column)
      self.slug_column = column
    end
  end
end