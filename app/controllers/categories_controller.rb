class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @category = Category.create(category_params)
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.category(:category).permit(:name)
  end

end
