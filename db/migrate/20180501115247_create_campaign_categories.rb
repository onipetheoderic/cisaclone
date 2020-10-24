class CreateCampaignCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_categories do |t|
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps
    end
    add_index :campaign_categories, :name, unique: true
    add_index :campaign_categories, :icon, unique: true
  end
end
