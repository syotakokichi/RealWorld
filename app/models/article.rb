class Article < ApplicationRecord
  before_validation :generate_slug

  private

  def generate_slug
    self.slug = title.parameterize if title
  end
end
