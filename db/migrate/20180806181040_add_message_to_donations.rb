class AddMessageToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :message, :text
  end
end
