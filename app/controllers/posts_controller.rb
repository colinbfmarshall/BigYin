class PostsController < ApplicationController
  before_action :set_topic, only: [:new, :create, :index, :edit, :update]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: %i[new create]
  respond_to :html, :xml, :json

  # GET /posts
  # GET /posts.json
  def index
    @posts = @topic.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.topic = @topic
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post created but we need to process it.' }
        format.json {render action: 'show', :id => @post.id}
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit!
    end
end
