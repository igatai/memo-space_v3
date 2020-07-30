class AddEventRefToMemo < ActiveRecord::Migration[5.2]
  def change
    add_reference :memos, :event, index: true
  end
end
