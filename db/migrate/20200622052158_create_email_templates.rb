class CreateEmailTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.string :subject
      t.string :variables
      t.text :content
      t.string :sender_email_address

      t.timestamps
    end
    add_index :email_templates, :name, unique: true
  end
end
