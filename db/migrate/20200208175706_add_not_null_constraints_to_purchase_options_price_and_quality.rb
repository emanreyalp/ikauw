class AddNotNullConstraintsToPurchaseOptionsPriceAndQuality < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:purchase_options, :price, false)
    change_column_null(:purchase_options, :quality, false)
  end
end
