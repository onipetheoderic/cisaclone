class BlogController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @blog_post = Blog::BlogPostForm.new
  end

  def create
    @form = Blog::BlogPostForm.from_params(params)

    Blog::CreateBlogPost.call(@form) do
      on(:invalid_blog_post) {render :new}
      on(:blog_post_created) do |blog|
        flash.now[:alert] = 'Blog Post was succesfully created'
        redirect_to blog_path(blog)
      end
    end
  end

end
