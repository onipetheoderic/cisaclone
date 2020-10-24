class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.attachment :logo
      t.integer :display_order
      t.string :url

      t.timestamps
    end
  end
end
