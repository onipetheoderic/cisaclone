module Blog
  class CreateBlogPost < Rectify::Command
    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid_blog_post,form) if form.invalid?
      transaction do
        create_post
        notify_admin
        notify_owner
      end
      broadcast(:blog_post_created,blog_post)
    end

    private
    attr_reader :form, :blog_post

    def create_post
      @blog_post ||= Post.new(form.attributes)
      @blog_post.save!(validate: false)
    end

    def notify_admin

    end

    def notify_owner

    end

  end

end
