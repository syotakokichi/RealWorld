class Api::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @article
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end  

  private

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end

  def set_article
    @article = Article.find_by!(slug: params[:slug])
  end

  def generate_unique_slug(title)
    slug = title.parameterize
    count = 2
    while Article.exists?(slug: slug)
      slug = "#{title.parameterize}-#{count}"
      count += 1
    end
    slug
  end
end
