module CategoriesHelper
  def category_names(categories)
    categories.collect {|category| category.name}.join(", ")
  end
end
