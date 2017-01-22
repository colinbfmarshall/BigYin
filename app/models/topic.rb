class Topic < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  accepts_nested_attributes_for :posts

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true

  include ImageUploader[:image] # adds an `image` virtual attribute

end
