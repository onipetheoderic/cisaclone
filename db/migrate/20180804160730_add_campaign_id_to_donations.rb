class AddCampaignIdToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :campaign_id, :string
  end
end
