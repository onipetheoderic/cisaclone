class AddPurposeToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :purpose, :text
  end
end
