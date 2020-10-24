module Blog
  class RejectPost < Rectify::Command

    def initialize(post,admin)
      @post, @admin = post, admin
    end

    def call
      transaction do
        @post.update_attributes!({declined_by: admin.id, declined_on: DateTime.now, declined: true})
        post.trigger(:reject)
      end
      broadcast(:post_published_success,post)
    end

    private
    attr_reader :post, :admin

  end

end
