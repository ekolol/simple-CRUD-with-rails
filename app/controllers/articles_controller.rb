# frozen_string_literal: true

# ArticlessController
class ArticlesController < ApplicationController
  # create new articles
  def new
    @article = Article.new
  end

  # for look all articles index
  def index
    @articles = Article.all
  end

  # for show articles by id
  def show
    @article = Article.find(params[:id])
  end

  # edit article by id
  def edit
    @article = Article.find(params[:id])
  end

  # create new articles article_params
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # update articles
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # destroy articles
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # private
  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
