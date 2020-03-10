class ChangeColumnToNotNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :tags, :name, false
  end
end
