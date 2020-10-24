class AddSlugToCareers < ActiveRecord::Migration[5.1]
  def change
    add_column :careers, :slug, :string, after: :id
    add_index :careers, :slug
  end
end
