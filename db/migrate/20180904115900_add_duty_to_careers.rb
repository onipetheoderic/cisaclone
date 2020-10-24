class AddDutyToCareers < ActiveRecord::Migration[5.1]
  def change
    add_column :careers, :duty, :text
  end
end
