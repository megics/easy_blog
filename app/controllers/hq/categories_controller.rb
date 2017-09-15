class Hq::CategoriesController < ApplicationController
  layout 'hq/application'

  add_breadcrumb "Kategoriler", :hq_categories_path

  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    add_breadcrumb @category.name, hq_category_path(@category)
    respond_with(@category)
  end

  def new
    add_breadcrumb "Yeni Kategori", new_hq_category_path
    @category = Category.new
    respond_with(@category)
  end

  def edit
    add_breadcrumb @category.name, hq_categories_path(@category)
    add_breadcrumb "Kategori düzenle", edit_hq_category_path
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(:hq, @category, location:request_referer)
  end

  private

  def category_params
    params.require(:@category).permit(:name)
  end

end
