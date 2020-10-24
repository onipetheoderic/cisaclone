class AddRaisedToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :raised, :decimal
  end
end
