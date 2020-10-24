class AddSkillsToCareers < ActiveRecord::Migration[5.1]
  def change
    add_column :careers, :skills, :text
  end
end
