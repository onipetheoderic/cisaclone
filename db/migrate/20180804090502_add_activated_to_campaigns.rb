class AddActivatedToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :activated, :boolean, default:false
  end
end
