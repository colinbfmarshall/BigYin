class VideosController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    # @videos = Video.where(processed: true)
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    
    respond_to do |format|
      if @video.save
        format.html { redirect_to(@video, :notice => 'Video was successfully created, it make take a few minutes to process it before it goes live.') }
      else
        format.html { render :action => "new" }
      end
    end

  end

  def show
    @video = Video.find(params[:id])
  end

  def update
    @topic.update(topic_params)
    redirect_to root_path
  end

  private

  def video_params
    params.require(:video).permit(:video, :video_data, :topic_id, :processed, :user_id)
  end
end