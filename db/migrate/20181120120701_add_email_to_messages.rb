class AddEmailToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :email, :string
    add_column :messages, :phone, :string
  end
end
