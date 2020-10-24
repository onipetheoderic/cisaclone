class CreateResourcesCustoms < ActiveRecord::Migration[5.1]
  def change
    create_table :resources_customs do |t|
      t.string :title
      t.text :description
      t.boolean :published, default:true

      t.timestamps
    end
  end
end
