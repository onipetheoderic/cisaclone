class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :owner
      t.string :title
      t.text :body
      t.integer :approved_by
      t.datetime :published_at

      t.timestamps
    end
  end
end
