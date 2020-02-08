class ChangeContentColumnsNotNullConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:contents, :plot, false)
    change_column_null(:contents, :title, false)
  end
end
