module Blog
  class UpdateBlogPost < Rectify::Command

    def initialize(form)
      @form = form
      @blog_post = Post.find(form.id)
    end

    def call
      return broadcast(:invalid_blog_post_update,form) if form.invalid?
      transaction do
        update_post
        notify_owner
        notify_admin
      end
      broadcast(:blog_post_update_success, blog_post)
    end

    private
    attr_reader :form, :blog_post

    def update_post
      @blog_post.attributes = form.attributes
      @blog_post.save(validate: false)
    end

    def notify_owner

    end

    def notify_admin

    end

  end

end
