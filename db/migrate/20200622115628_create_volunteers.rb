class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.string :full_name
      t.string :email
      t.attachment :photo
      t.string :telephone
      t.string :address
      t.text :description
      t.string :facebook_handle
      t.string :twitter_handle
      t.string :instagram_handle

      t.timestamps
    end
    add_index :volunteers, :email, unique: true
    add_index :volunteers, :telephone, unique: true
  end
end
