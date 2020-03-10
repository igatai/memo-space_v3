class RenameContentToMemos < ActiveRecord::Migration[5.0]
  def change
    rename_column :memos, :content, :text
  end
end
