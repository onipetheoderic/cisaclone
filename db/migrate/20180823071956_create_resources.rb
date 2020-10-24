class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.boolean :published, default:true
      t.string :slug

      t.timestamps
    end
  end
end
