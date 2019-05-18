class AddSeasonIdToContentsAndSetItToForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :season_id, :integer
    add_foreign_key :contents, :contents, column: :season_id
  end
end
