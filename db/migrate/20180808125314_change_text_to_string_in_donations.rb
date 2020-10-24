class ChangeTextToStringInDonations < ActiveRecord::Migration[5.1]
  def change
  	change_column :donations, :purpose, :string
  end
end
