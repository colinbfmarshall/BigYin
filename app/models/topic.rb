class Topic < ActiveRecord::Base
  has_many :videos
  accepts_nested_attributes_for :videos
end
