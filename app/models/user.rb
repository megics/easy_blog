class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :article, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/avatar.png"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  attr_accessor :avatar_file_name
  enum gender: [ :female, :male ]

end
