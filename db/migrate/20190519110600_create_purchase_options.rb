class CreatePurchaseOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_options do |t|
      t.decimal :price
      t.string :quality

      t.timestamps
    end
  end
end
