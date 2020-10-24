class CreateSeos < ActiveRecord::Migration[5.1]
  def change
    create_table :seos do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
    add_index :seos, :name, unique: true
  end
end
