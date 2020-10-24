class AddResponsibilityToCareers < ActiveRecord::Migration[5.1]
  def change
    add_column :careers, :responsibility, :text
  end
end
