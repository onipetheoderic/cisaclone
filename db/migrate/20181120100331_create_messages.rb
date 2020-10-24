class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :first_name
      t.string :last_name
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
