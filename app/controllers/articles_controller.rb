class ArticlesController < ApplicationController
  #before_action get_article, only: [:show, :edit, :update, :destroy]
  #http_basic_authenticate_with email: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    #@articles_category = Category.new
    @article = Article.new
  end

  def create
    #@articles_category = Category.new(category_params)
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'

    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  # def category_params
  #   params.require(:category).permit(:name)
  # end
  #

=begin
  def get_article
    @article = Article.find(params[:id])
  end
=end

end
