class AddUpcomingToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :upcoming, :boolean, default:false
  end
end
