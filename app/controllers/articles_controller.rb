class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories = Category.all.collect{|m| [m.name, m.id] }
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
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
    @categories = Category.all.collect{|m| [m.name, m.id] }
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      @categories = Category.all.collect{|m| [m.name, m.id] }
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
    params.require(:article).permit(:title, :text, {category_ids:[]})
  end

  # def load_categories
  #   @categories = Category.all.collect{|m| [m.name, m.id] }
  # end

  # def category_params
  #   params.require(:category).permit(:name)
  # end
  #


end
