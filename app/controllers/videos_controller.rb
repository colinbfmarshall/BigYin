class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_post, only: [:new, :create, :edit, :update]

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.post = @post
    @video.user = current_user


    respond_to do |format|
      if @video.save
        format.html { redirect_to post_video_path(@post, @video), :notice => 'Video was successfully created, it make take a few minutes to process it before it goes live.' }
        format.js { redirect_to post_video_path(@post, @video), :notice => 'Video was successfully created, it make take a few minutes to process it before it goes live.' }
      else
        format.html { render :action => "new" }
      end
    end

  end

  def show
    @video = Video.find(params[:id])
  end

  def update
    @video.update(video_params)
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def video_params
    params.require(:video).permit!
  end
end
