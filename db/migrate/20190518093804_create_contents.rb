class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :type
      t.string :title
      t.string :plot

      t.timestamps
    end
  end
end
