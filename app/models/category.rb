class Category < ApplicationRecord
  #has_many :articles
  has_and_belongs_to_many :articles
  def with_name
    "#{name}"
  end
end
