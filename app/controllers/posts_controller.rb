class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def like
    @post = Post.find(params[:post])
    @post.liked_by current_user
    respond_with @post, :location => user_profile_url(@post.user.user_profile)
    
  end

  def unlike
    @post = Post.find(params[:post])
    @post.unliked_by current_user
    redirect_to :back
  end
  # GET /posts
  # GET /posts.json
  def index
    if params[:tag]
      @tag = ActsAsTaggableOn::Tag.find(params[:tag])
      @posts = Post.tagged_with(@tag)
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 5)
    end
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
    @post.user = current_user
    @post.save
    respond_with @post, :location => user_profile_url(current_user.user_profile)
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :tag_list)
    end
end
