class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.string :currency_type

      t.timestamps
    end
  end
end
