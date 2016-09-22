class PostsController < ApplicationController
  before_action :set_topic, only: [:new, :create, :index, :edit, :update, :upvote, :downvote]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: %i[new create upvote downvote]
  respond_to :html, :xml, :json

  def index
    if @topic.present?
      @posts = @topic.posts.published
    else
      @posts = Post.published
    end

  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.topic = @topic
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Your video has been uploaded but we need to process it, this may take a few minutes.' }
        format.json {render action: 'show', :id => @post.id, notice: 'Your video has been uploaded but we need to process it, this may take a few minutes.'}
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: 'Post updated but we need to process it.' }
        format.json {render action: 'show', :id => @post.id}
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.upvote_by current_user
    next_post
  end

  def downvote
    @post.downvote_from current_user
    next_post
  end

  private

    def set_topic
      @topic = Topic.find(params[:topic_id]) if params[:topic_id].present?
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def next_post
      topic_posts = @post.topic.posts
      @other = topic_posts.published.order("RANDOM()").reject { |p| p.id == set_post.id }
      if @other.count == 0
        redirect_to posts_path, notice: "There's only one video on this topic right now. Why not share us with your friends!" 
      else 
        @next = @other.first
        redirect_to @next
      end
    end

    def post_params
      params.require(:post).permit!
    end
end
