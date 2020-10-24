class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :requested_from_api?
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve, :reject]

  include Rectify::ControllerHelpers


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    # @post = Post.new
    @post = Blog::BlogPostForm.new
  end

  # GET /posts/1/edit
  def edit
    @post = Blog::BlogPostForm.from_model(Post.find(params[:id]))
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Blog::BlogPostForm.from_params(params, :owner_id => current_user.id)
    respond_to do |format|
      Blog::CreateBlogPost.call(@post) do
        on(:invalid_blog_post) do |form|
          format.html { render :new }
          format.json { render json: form.errors, status: :unprocessable_entity }
        end
        on(:blog_post_created) do |blog|
          expose(:post => blog)
          flash.now[:alert] = 'Blog Post was succesffuly created'
          format.html { redirect_to blog, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: blog }
        end
      end
    end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Blog::BlogPostForm.from_params(params,:owner_id => current_user.id)

    respond_to do |format|
      Blog::UpdateBlogPost.call(@post) do
        on(:invalid_blog_post_update) do |form|
          format.html { render :edit }
          format.json { render json: form.errors, status: :unprocessable_entity }
        end
        on(:blog_post_update_success) do |blog|
          format.html { redirect_to blog, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: blog }
        end
      end
    end
  end

  def approve
    respond_to do |format|
      Blog::ApprovePost.call(@post,current_user.id) do
        on(:post_approval_success) do
          format.html{redirect_to @post, notice: "Post has been appoved"}
        end
      end
    end
  end

  def reject

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
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:owner_id, :title, :body, :approved_by_id)
    end
end
