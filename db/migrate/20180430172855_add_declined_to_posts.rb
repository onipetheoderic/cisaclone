class AddDeclinedToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :declined, :boolean,     default: true
    add_column :posts, :approved_on, :datetime
    add_column :posts, :declined_on, :datetime
    add_column :posts, :declined_by, :integer
  end
end
