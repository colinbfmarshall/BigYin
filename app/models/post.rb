class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  include VideoUploader[:video]

  after_save :check_processing

  def check_processing
    if self.video_data.include? "screenshot"
      self.update_column(:processed, true)
    else
      self.update_column(:processed, false)
    end
  end


end
