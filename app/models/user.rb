class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :videos
  has_many :posts

  acts_as_voter


end
