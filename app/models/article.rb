class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  belongs_to :user, required: false
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
end
