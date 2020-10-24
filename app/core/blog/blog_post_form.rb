module Blog
  class BlogPostForm < Rectify::Form
    mimic :post
    attribute :owner_id,    Integer
    attribute :title,       String
    attribute :body,        String
    

    validates :owner_id, :title, :body, presence: true

  end

end
