class AddNotNullConstraintsToPurchase < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:purchases, :user_id, false)
    change_column_null(:purchases, :content_id, false)
    change_column_null(:purchases, :purchase_option_id, false)
  end
end
