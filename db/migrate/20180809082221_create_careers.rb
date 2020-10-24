class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string :title
      t.text :description
      t.boolean :published
      t.boolean :closed

      t.timestamps
    end
    add_index :careers, :title
  end
end
