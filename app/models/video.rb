class Video < ActiveRecord::Base
  belongs_to :user

  

  include VideoUploader[:video]
  # validates_presence_of :topic_id

  after_save :check_processing

  def check_processing
    if self.video_data.include? "screenshot"
      self.update_column(:processed, true)
    else
      self.update_column(:processed, false)
    end
  end

end