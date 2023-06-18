# app/controllers/api/articles_controller.rb
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

  def set_article
    @article = Article.find_by!(slug: params[:slug])
  end

  def article_params
    params.require(:article).permit(:title, :description, :body).tap do |article_params|
      article_params[:tags] = params[:article][:tagList].map do |tag_name|
        Tag.find_or_create_by(name: tag_name)
      end
    end
  end
end
