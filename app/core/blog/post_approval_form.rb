module Blog
  class PostApprovalForm < Rectify::Form

    attribute :post,            BlogPostForm
    attribute :approved_by,     Integer
    attribute :approved_at,    DateTime

  end

end
