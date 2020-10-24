class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :slug
      t.string :title
      t.string :short_description
      t.text :description
      t.string :location
      t.attachment :image
      t.date :starts_at
      t.date :ends_at
      t.boolean :published
      t.boolean :active

      t.timestamps
    end
    add_index :programs, :slug
    add_index :programs, :title
  end
end
