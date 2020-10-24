class AddUserIdToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :user_id, :string
  end
end
