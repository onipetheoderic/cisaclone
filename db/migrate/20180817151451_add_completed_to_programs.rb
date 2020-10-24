class AddCompletedToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :completed, :boolean, default:false
  end
end
