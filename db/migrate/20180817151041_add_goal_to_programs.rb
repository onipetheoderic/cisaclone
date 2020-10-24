class AddGoalToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :goal, :decimal
  end
end
