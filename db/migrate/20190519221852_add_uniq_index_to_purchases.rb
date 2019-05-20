class AddUniqIndexToPurchases < ActiveRecord::Migration[5.2]
  def change
    columns = [:user_id, :content_id, :purchase_option_id]
    index_name = 'index_purchases_on_user_id_content_id_and_purchase_option_id'
    add_index :purchases, columns, unique: true, name: index_name
  end
end
