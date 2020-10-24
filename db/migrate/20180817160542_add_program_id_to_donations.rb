class AddProgramIdToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :program_id, :string
  end
end
