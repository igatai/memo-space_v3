class RenameContentToMemos < ActiveRecord::Migration[5.2]
  def change
    rename_column :memos, :content, :text
  end
end
