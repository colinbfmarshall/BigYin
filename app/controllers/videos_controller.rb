class VideosController < ApplicationController
  before_action :set_topic

  def index
    @videos = @topic.videos
  end

  def create
    video = @topic.videos.create(video_params)
    raise video.inspect
    render partial: "video", locals: {video: video, idx: @topic.videos.count}
  end

  def show
    @video = Video.find(params[:id])
  end

  def update
    @topic.update(topic_params)
    redirect_to root_path
  end

  private

  def set_topic
    @topic = Topic.first_or_create!
  end

  def topic_params
    params.require(:topic).permit!
  end

  def video_params
    params.require(:video).permit!
  end
end
