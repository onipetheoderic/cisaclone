class AddUserIdToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :user_id, :string
  end
end
