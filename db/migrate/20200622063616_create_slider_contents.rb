class CreateSliderContents < ActiveRecord::Migration[5.1]
  def change
    create_table :slider_contents do |t|
      t.attachment :banner
      t.string :caption
      t.string :rider
      t.integer :display_order

      t.timestamps
    end
  end
end
