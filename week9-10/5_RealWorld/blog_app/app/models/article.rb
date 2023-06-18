# app/models/article.rb
class Article < ApplicationRecord
  has_many :article_tags
  has_many :tags, through: :article_tags

  before_save :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end
end
