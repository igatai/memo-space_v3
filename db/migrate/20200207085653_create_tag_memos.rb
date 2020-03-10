class CreateTagMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_memos do |t|
      t.references :tag, foreign_key: true
      t.references :memo, foreign_key: true
      t.timestamps
    end
  end
end