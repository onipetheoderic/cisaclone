module Blog
  class ApprovePost < Rectify::Command

    def initialize(post,admin)
      @post, @admin = post, admin
    end

    def call
      transaction do
        @post.update_attributes!({approved_by: admin.id, approved_on: DateTime.now, declined: false})
        post.trigger(:approve)
      end
      broadcast(:post_approval_success,post)
    end

    private
    attr_reader :post, :admin

  end

end
