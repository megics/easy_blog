class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  #belongs_to :category
  has_and_belongs_to_many :categories
end
