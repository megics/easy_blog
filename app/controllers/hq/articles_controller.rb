class Hq::ArticlesController < ApplicationController
  layout 'hq/application'

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Makaleler", :hq_articles_path


  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    add_breadcrumb @article.title, hq_article_path(@article)
    respond_with(@article)
  end

  def edit
    add_breadcrumb @article.title, hq_articles_path(@article)
    add_breadcrumb "Makale düzenle", edit_hq_article_path
  end

  def destroy
    @article.destroy
    respond_with(:hq, @article, location:request.referer)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
