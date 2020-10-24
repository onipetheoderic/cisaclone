class RemoveUserIdFromProgams < ActiveRecord::Migration[5.1]
  def change
    remove_column :programs, :user_id, :integer
  end
end
