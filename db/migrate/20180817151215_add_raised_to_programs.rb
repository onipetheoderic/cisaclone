class AddRaisedToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :raised, :decimal
  end
end
