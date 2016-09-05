class Video < ActiveRecord::Base
  belongs_to :user

  include VideoUploader[:video]

end
