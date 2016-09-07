class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_one :video
end
