class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :short_description

      t.timestamps
    end
    add_index :communities, :name, unique: true
  end
end
