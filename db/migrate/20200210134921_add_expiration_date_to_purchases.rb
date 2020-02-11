class AddExpirationDateToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :expiration_date, :datetime
  end
end
