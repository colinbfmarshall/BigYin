class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  include VideoUploader[:video]

  validate :one_live_video, on: :create
  after_update :processing_completed

  # Need to create method that checks whether the processing has been completed on video.  
  # The object will UPDATE once transcoding is complete, so a validation on UPDATE may work.
  # Need to check the video_data has been attached and then whether the screenshot string is present.

  def processing_completed
    if self.video_data.include? "screenshot"
      self.update_column(:processed, true)
    else
      self.update_column(:processed, false)
    end
  end

  def one_live_video
    other_videos_on_topic = user.posts.where(topic_id: topic.id)
    if other_videos_on_topic.count > 1
      other_videos_on_topic.update_all(live: false)
    end
  end

end
