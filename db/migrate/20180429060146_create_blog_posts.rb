class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.references :owner
      t.string :title
      t.text :body
      t.datetime :published_at
      t.integer :approved_by_id
      t.attachment :picture

      t.timestamps
    end
  end
end
