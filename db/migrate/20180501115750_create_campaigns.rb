class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.references :campaign_category, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.text :story
      t.integer :facebooK_shares
      t.integer :twitter_shares
      t.integer :likes
      t.decimal :goal

      t.timestamps
    end
  end
end
