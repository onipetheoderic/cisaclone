class AddResponseReferenceToDonation < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :response_reference, :string
  end
end
