class AddNumberToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :number, :integer
  end
end
