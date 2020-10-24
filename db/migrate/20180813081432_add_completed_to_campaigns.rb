class AddCompletedToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :completed, :boolean, default:false
  end
end
